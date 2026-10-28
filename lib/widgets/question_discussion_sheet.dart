import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../providers/auth_provider.dart';
import '../services/storage_service.dart';
import '../widgets/neu_widgets.dart';
import 'aspirant_avatar.dart';

class DiscussionComment {
  final String id;
  final String authorName;
  final String commentText;
  final DateTime timestamp;

  DiscussionComment({
    required this.id,
    required this.authorName,
    required this.commentText,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'authorName': authorName,
        'commentText': commentText,
        'timestamp': timestamp.toIso8601String(),
      };

  factory DiscussionComment.fromJson(Map<String, dynamic> json) => DiscussionComment(
        id: json['id'] as String? ?? '',
        authorName: json['authorName'] as String? ?? 'You',
        commentText: json['commentText'] as String? ?? '',
        timestamp: DateTime.tryParse(json['timestamp'] as String? ?? '') ?? DateTime.now(),
      );
}

class QuestionDiscussionSheet extends StatefulWidget {
  final PYQ pyq;

  const QuestionDiscussionSheet({super.key, required this.pyq});

  static void show(BuildContext context, PYQ pyq) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.scaffoldBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => QuestionDiscussionSheet(pyq: pyq),
    );
  }

  @override
  State<QuestionDiscussionSheet> createState() => _QuestionDiscussionSheetState();
}

class _QuestionDiscussionSheetState extends State<QuestionDiscussionSheet> {
  final TextEditingController _commentController = TextEditingController();
  final List<DiscussionComment> _comments = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDiscussions();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  String get _storageKey => 'q_personal_notes_${widget.pyq.id}';

  void _loadDiscussions() {
    try {
      final rawList = StorageService().prefs.getStringList(_storageKey) ?? [];
      final loaded = rawList.map((str) {
        final Map<String, dynamic> data = jsonDecode(str);
        return DiscussionComment.fromJson(data);
      }).toList();

      setState(() {
        _comments.clear();
        _comments.addAll(loaded);
        _isLoading = false;
      });
    } catch (_) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _saveDiscussions() async {
    final rawList = _comments.map((c) => jsonEncode(c.toJson())).toList();
    await StorageService().prefs.setStringList(_storageKey, rawList);
  }

  void _postComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final author = authProvider.isLoggedIn ? authProvider.userName : 'My Note';

    setState(() {
      _comments.insert(
        0,
        DiscussionComment(
          id: 'note_${DateTime.now().millisecondsSinceEpoch}',
          authorName: author,
          commentText: text,
          timestamp: DateTime.now(),
        ),
      );
      _commentController.clear();
    });

    _saveDiscussions();
    HapticFeedback.lightImpact();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Note saved to question!'),
        backgroundColor: AppTheme.accentMint,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _deleteComment(int index) {
    setState(() {
      _comments.removeAt(index);
    });
    _saveDiscussions();
    HapticFeedback.selectionClick();
  }

  void _shareQuestion() {
    final q = widget.pyq;
    final buffer = StringBuffer();
    buffer.writeln('🎯 *GATE Question Doubt* (${q.subject} • ${q.year})');
    buffer.writeln('');
    buffer.writeln(q.questionText);
    buffer.writeln('');
    if (q.options.isNotEmpty) {
      for (int i = 0; i < q.options.length; i++) {
        final label = String.fromCharCode(65 + i);
        buffer.writeln('($label) ${q.options[i]}');
      }
      buffer.writeln('');
    }
    buffer.writeln('Discussed via GateX: The GATE DA & CS/IT Prep Companion');

    Clipboard.setData(ClipboardData(text: buffer.toString()));
    HapticFeedback.mediumImpact();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Question copied to clipboard!'),
        backgroundColor: AppTheme.accentPurple,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'Share',
          textColor: Colors.white,
          onPressed: () => Share.share(buffer.toString()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.pyq;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: EdgeInsets.fromLTRB(16, 12, 16, bottomInset + 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: context.textColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.edit_note_rounded, size: 20, color: AppTheme.accentPurple),
                        const SizedBox(width: 8),
                        Text(
                          'Question Notes & Shortcuts',
                          style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: context.textColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${q.subject} • ${q.topic} (${q.year})',
                      style: GoogleFonts.outfit(fontSize: 12, color: context.textSecondaryColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.share_outlined, size: 20, color: AppTheme.accentPurple),
                    tooltip: 'Share Question',
                    onPressed: _shareQuestion,
                  ),
                  IconButton(
                    icon: Icon(Icons.close_rounded, color: context.textSecondaryColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(height: 1, color: context.colorBorder),
          const SizedBox(height: 12),

          // Discussion Thread List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _comments.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: AppTheme.accentPurple.withValues(alpha: 0.12),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.note_add_outlined,
                                  size: 28,
                                  color: AppTheme.accentPurple,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                'No Personal Notes Yet',
                                style: GoogleFonts.outfit(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: context.textColor,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Save your personal calculation shortcuts, edge-case traps, or derivation notes for this question. They will stay saved on your device.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  color: context.textSecondaryColor,
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 16),
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppTheme.accentPurple,
                                  side: BorderSide(color: AppTheme.accentPurple.withValues(alpha: 0.4)),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                ),
                                icon: const Icon(Icons.share_rounded, size: 16),
                                label: Text(
                                  'Share Question',
                                  style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600),
                                ),
                                onPressed: _shareQuestion,
                              ),
                            ],
                          ),
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          final comment = _comments[index];
                          return NeuContainer(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(14.0),
                            borderRadius: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        AspirantAvatar(
                                          size: 24,
                                          seedName: comment.authorName,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          comment.authorName,
                                          style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete_outline_rounded, size: 16, color: context.textSecondaryColor),
                                      tooltip: 'Delete Note',
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      onPressed: () => _deleteComment(index),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  comment.commentText,
                                  style: TextStyle(color: context.textColor, fontSize: 13, height: 1.45),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
          ),

          // Comment Input Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: context.colorSurfaceElevated,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.colorBorder),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: TextStyle(color: context.textColor, fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Add a personal shortcut or key point...',
                      hintStyle: TextStyle(color: context.textSecondaryColor, fontSize: 12.5),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    ),
                    onSubmitted: (_) => _postComment(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send_rounded, color: AppTheme.accentPurple, size: 20),
                  onPressed: _postComment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
