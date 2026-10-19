import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../providers/auth_provider.dart';

class DiscussionComment {
  final String id;
  final String authorName;
  final String commentText;
  final DateTime timestamp;
  int upvotes;
  bool isUpvoted;

  DiscussionComment({
    required this.id,
    required this.authorName,
    required this.commentText,
    required this.timestamp,
    this.upvotes = 0,
    this.isUpvoted = false,
  });
}

class QuestionDiscussionSheet extends StatefulWidget {
  final PYQ pyq;

  const QuestionDiscussionSheet({super.key, required this.pyq});

  static void show(BuildContext context, PYQ pyq) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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

  void _loadDiscussions() {
    // Generate curated conceptual discussion seeds for popular topics
    final q = widget.pyq;
    final List<DiscussionComment> sampleSeeds = [];

    if (q.type == 'NAT') {
      sampleSeeds.add(
        DiscussionComment(
          id: 'seed_1_${q.id}',
          authorName: 'GATE Topper (AIR 42)',
          commentText: 'Pro Tip: For this NAT, always round only at the final step! Intermediate rounding can cause you to drift outside the official tolerance range.',
          timestamp: DateTime.now().subtract(const Duration(days: 3)),
          upvotes: 14,
        ),
      );
    } else if (q.type == 'MSQ') {
      sampleSeeds.add(
        DiscussionComment(
          id: 'seed_2_${q.id}',
          authorName: 'CS Scholar',
          commentText: 'Watch out: In this MSQ, remember there is zero negative marking! Verify every option independently by constructing a minimal counter-example.',
          timestamp: DateTime.now().subtract(const Duration(days: 5)),
          upvotes: 9,
        ),
      );
    } else {
      sampleSeeds.add(
        DiscussionComment(
          id: 'seed_3_${q.id}',
          authorName: 'IIT Madras Aspirant',
          commentText: 'Quick derivation shortcut: You can eliminate options C and D directly by dimensional/boundary analysis when x -> 0.',
          timestamp: DateTime.now().subtract(const Duration(days: 2)),
          upvotes: 11,
        ),
      );
    }

    setState(() {
      _comments.addAll(sampleSeeds);
      _isLoading = false;
    });
  }

  void _postComment() {
    final text = _commentController.text.trim();
    if (text.isEmpty) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final author = authProvider.isLoggedIn ? authProvider.userName : 'GateX Student';

    setState(() {
      _comments.insert(
        0,
        DiscussionComment(
          id: 'comment_${DateTime.now().millisecondsSinceEpoch}',
          authorName: author,
          commentText: text,
          timestamp: DateTime.now(),
          upvotes: 1,
          isUpvoted: true,
        ),
      );
      _commentController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Doubt / discussion posted!'),
        backgroundColor: AppTheme.primary,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.pyq;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
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
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 12),

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
                        const Icon(Icons.forum_outlined, size: 18, color: AppTheme.secondary),
                        const SizedBox(width: 8),
                        Text('Doubt & Shortcut Discussions', style: AppTheme.poppinsBold(fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${q.subject} > ${q.topic} (${q.year})',
                      style: const TextStyle(fontSize: 11.5, color: AppTheme.textSecondary),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded, color: AppTheme.textSecondary),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 1, color: Colors.white12),
          const SizedBox(height: 10),

          // Discussion Thread List
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _comments.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.chat_bubble_outline_rounded, size: 40, color: AppTheme.textSecondary.withValues(alpha: 0.4)),
                            const SizedBox(height: 8),
                            const Text(
                              'No discussions yet.\nBe the first to share an alternative calculation shortcut!',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppTheme.textSecondary, fontSize: 12.5),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          final comment = _comments[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 10),
                            color: AppTheme.background,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 12,
                                            backgroundColor: AppTheme.primary.withValues(alpha: 0.2),
                                            child: Text(
                                              comment.authorName.isNotEmpty ? comment.authorName[0].toUpperCase() : 'U',
                                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.primary),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            comment.authorName,
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      // Upvote Button
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (comment.isUpvoted) {
                                              comment.upvotes--;
                                              comment.isUpvoted = false;
                                            } else {
                                              comment.upvotes++;
                                              comment.isUpvoted = true;
                                            }
                                          });
                                        },
                                        borderRadius: BorderRadius.circular(6),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: comment.isUpvoted ? AppTheme.primary.withValues(alpha: 0.15) : Colors.white.withValues(alpha: 0.05),
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(
                                              color: comment.isUpvoted ? AppTheme.primary : Colors.white12,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.thumb_up_alt_rounded,
                                                size: 12,
                                                color: comment.isUpvoted ? AppTheme.primary : AppTheme.textSecondary,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '${comment.upvotes}',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: comment.isUpvoted ? AppTheme.primary : AppTheme.textSecondary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    comment.commentText,
                                    style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13, height: 1.4),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),

          // Comment Input Box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                    decoration: const InputDecoration(
                      hintText: 'Share a calculation shortcut or doubt...',
                      hintStyle: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send_rounded, color: AppTheme.primary, size: 20),
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
