import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../utils/math_markdown_builder.dart';
import '../widgets/neu_widgets.dart';

class CommunityPost {
  final String id;
  final String authorName;
  final bool isPro;
  final String channel;
  final String title;
  final String content;
  int upvotes;
  bool isUpvoted;
  bool isSolved;
  int replyCount;
  final DateTime createdAt;
  final List<CommunityReply> replies;

  CommunityPost({
    required this.id,
    required this.authorName,
    this.isPro = false,
    required this.channel,
    required this.title,
    required this.content,
    this.upvotes = 0,
    this.isUpvoted = false,
    this.isSolved = false,
    this.replyCount = 0,
    required this.createdAt,
    this.replies = const [],
  });
}

class CommunityReply {
  final String id;
  final String authorName;
  final bool isPro;
  final String content;
  int upvotes;
  bool isUpvoted;
  final DateTime createdAt;

  CommunityReply({
    required this.id,
    required this.authorName,
    this.isPro = false,
    required this.content,
    this.upvotes = 0,
    this.isUpvoted = false,
    required this.createdAt,
  });
}

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  String _selectedChannel = '#All-Channels';
  String _selectedFilter = 'All'; // 'All', 'Unresolved', 'Most Upvoted', 'PRO Rankers'
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> _channels = [
    '#All-Channels',
    '#Machine-Learning-AI',
    '#Linear-Algebra-Calculus',
    '#DSA-Programming',
    '#General-Aptitude-Tricks',
    '#Mock-Exam-Strategy',
  ];

  late List<CommunityPost> _posts;

  @override
  void initState() {
    super.initState();
    _posts = _getSeedPosts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<CommunityPost> _getSeedPosts() {
    return [
      CommunityPost(
        id: 'post_1',
        authorName: 'Arjun Sharma',
        isPro: true,
        channel: '#Machine-Learning-AI',
        title: 'Bias vs Variance tradeoff in SVM with RBF Kernel',
        content: r'When $\gamma$ in Gaussian RBF kernel is increased, does model variance increase or decrease? My calculation shows that higher $\gamma$ makes the Gaussian bell sharper, leading to severe overfitting (higher variance). Can someone verify this intuition?',
        upvotes: 38,
        isUpvoted: false,
        isSolved: true,
        replyCount: 4,
        createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        replies: [
          CommunityReply(
            id: 'rep_1',
            authorName: 'Pooja Iyer (AIR 42 DA)',
            isPro: true,
            content: r'Your intuition is 100% correct! High $\gamma = 1/(2\sigma^2)$ implies very small $\sigma$. Each training point gets its own narrow peak, which causes high variance and low bias (overfitting). Lower $\gamma$ makes it smoother (higher bias).',
            upvotes: 19,
            createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          ),
          CommunityReply(
            id: 'rep_2',
            authorName: 'Rohit Verma',
            isPro: false,
            content: r'Remember the shortcut for GATE DA: $\gamma \uparrow \implies$ Overfitting $\implies$ High Variance. $C \uparrow \implies$ Low tolerance for errors $\implies$ High Variance.',
            upvotes: 12,
            createdAt: DateTime.now().subtract(const Duration(hours: 1)),
          ),
        ],
      ),
      CommunityPost(
        id: 'post_2',
        authorName: 'Neha Deshmukh',
        isPro: false,
        channel: '#Linear-Algebra-Calculus',
        title: r'Shortcut to find Eigenvalues of 3x3 companion matrix',
        content: r'Is there a trick to find eigenvalues when matrix is in companion form without computing $\det(A - \lambda I) = 0$ manually? Takes more than 3 minutes in CBT test.',
        upvotes: 24,
        isUpvoted: false,
        isSolved: true,
        replyCount: 2,
        createdAt: DateTime.now().subtract(const Duration(hours: 7)),
        replies: [
          CommunityReply(
            id: 'rep_3',
            authorName: 'Devansh K.',
            isPro: true,
            content: r'For any companion matrix, the characteristic polynomial coefficients are directly read from the last row or column! $\lambda^n + c_{n-1}\lambda^{n-1} + \dots + c_0 = 0$. Also check $\text{Trace}(A) = \sum \lambda_i$ and $\det(A) = \prod \lambda_i$ first to eliminate options in 20 seconds.',
            upvotes: 15,
            createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          ),
        ],
      ),
      CommunityPost(
        id: 'post_3',
        authorName: 'Karan Mehra',
        isPro: true,
        channel: '#General-Aptitude-Tricks',
        title: 'Spatial Aptitude - Paper Folding 3D visualization tip',
        content: 'For the paper folding and cutting questions (2 Marks guaranteed in GA): do not try to mentally simulate all 3 folds at once. Unfold step-by-step from the last cut with mirror reflections along each crease line.',
        upvotes: 45,
        isUpvoted: true,
        isSolved: true,
        replyCount: 3,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        replies: [
          CommunityReply(
            id: 'rep_4',
            authorName: 'Ananya Roy',
            isPro: false,
            content: 'Brilliant tip! Mirror reflection across fold line saved 2 marks for me in the last test.',
            upvotes: 8,
            createdAt: DateTime.now().subtract(const Duration(hours: 18)),
          ),
        ],
      ),
      CommunityPost(
        id: 'post_4',
        authorName: 'Siddharth Rao',
        isPro: false,
        channel: '#Mock-Exam-Strategy',
        title: 'How do you handle NAT questions in the last 30 minutes?',
        content: 'I noticed I make silly calculation slips in NAT questions under time pressure. Should I attempt NATs first or MCQs first?',
        upvotes: 18,
        isUpvoted: false,
        isSolved: false,
        replyCount: 5,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        replies: [
          CommunityReply(
            id: 'rep_5',
            authorName: 'Kunal Patil',
            isPro: true,
            content: 'Strategy: NAT has NO negative marking! Never leave a NAT blank if you can reasonably estimate. But attempt high-confidence MCQs in Round 1 (first 80 mins), and save complex 2M NATs for Round 2 so you do not rush the arithmetic.',
            upvotes: 14,
            createdAt: DateTime.now().subtract(const Duration(days: 1)),
          ),
        ],
      ),
    ];
  }

  // Anti-Spam Validator
  bool _containsSpam(String text) {
    final spamRegex = RegExp(
      r'(t\.me\/|telegram\.me\/|chat\.whatsapp\.com|wa\.me\/|https?:\/\/|www\.)',
      caseSensitive: false,
    );
    final phoneRegex = RegExp(r'\b\d{10,12}\b');
    return spamRegex.hasMatch(text) || phoneRegex.hasMatch(text);
  }

  void _openNewPostSheet() {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    String selectedChannel = _selectedChannel == '#All-Channels' ? '#Machine-Learning-AI' : _selectedChannel;
    String? errorMessage;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 18,
                right: 18,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ask Doubt / Share Shortcut',
                          style: AppTheme.poppinsBold(fontSize: 18),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close_rounded, size: 20, color: Colors.white70),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Channel picker
                    DropdownButtonFormField<String>(
                      value: selectedChannel,
                      dropdownColor: AppTheme.surface,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Select Channel',
                        labelStyle: const TextStyle(color: AppTheme.secondary),
                        filled: true,
                        fillColor: AppTheme.background,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                      items: _channels.where((c) => c != '#All-Channels').map((ch) {
                        return DropdownMenuItem(value: ch, child: Text(ch));
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setSheetState(() => selectedChannel = val);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    // Title
                    TextField(
                      controller: titleController,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Concise Question or Concept Title',
                        hintStyle: const TextStyle(color: AppTheme.textSecondary),
                        filled: true,
                        fillColor: AppTheme.background,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Content
                    TextField(
                      controller: contentController,
                      maxLines: 4,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Explain your doubt or solution...\nTip: Wrap math in \$...\$ (e.g. \$x^2 + y^2 = 1\$)',
                        hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                        filled: true,
                        fillColor: AppTheme.background,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                    if (errorMessage != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: AppTheme.error, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                    const SizedBox(height: 16),
                    // Guidelines Note
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.shield_outlined, size: 16, color: AppTheme.secondary),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Strict zero-spam policy: External links, phone numbers, and promotion are automatically filtered.',
                              style: TextStyle(color: AppTheme.textSecondary, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        final title = titleController.text.trim();
                        final content = contentController.text.trim();

                        if (title.length < 8) {
                          setSheetState(() => errorMessage = 'Title must be at least 8 characters long.');
                          return;
                        }
                        if (content.length < 15) {
                          setSheetState(() => errorMessage = 'Description must be at least 15 characters long.');
                          return;
                        }
                        if (_containsSpam(title) || _containsSpam(content)) {
                          setSheetState(() => errorMessage = 'External links, promo codes, and phone numbers are strictly prohibited.');
                          return;
                        }

                        // Add post
                        final newPost = CommunityPost(
                          id: 'post_${DateTime.now().millisecondsSinceEpoch}',
                          authorName: 'You (Aspirant)',
                          isPro: Provider.of<AppProvider>(context, listen: false).isPro,
                          channel: selectedChannel,
                          title: title,
                          content: content,
                          createdAt: DateTime.now(),
                        );

                        setState(() {
                          _posts.insert(0, newPost);
                        });

                        Navigator.pop(context);
                        ScaffoldMessenger.of(this.context).showSnackBar(
                          const SnackBar(
                            content: Text('Doubt posted successfully! Peer rankers will reply shortly.'),
                            backgroundColor: AppTheme.success,
                          ),
                        );
                      },
                      child: const Text('Post Doubt to Community', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _openThreadDetail(CommunityPost post) {
    final replyController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.88,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 12,
              ),
              child: Column(
                children: [
                  // Top bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          post.channel,
                          style: const TextStyle(color: AppTheme.primary, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded, size: 20, color: Colors.white70),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Thread Title & Question
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: AppTheme.primary.withValues(alpha: 0.3),
                                child: Text(
                                  post.authorName.isNotEmpty ? post.authorName[0] : 'U',
                                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                post.authorName,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              if (post.isPro) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFB300).withValues(alpha: 0.18),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text('PRO', style: TextStyle(color: Color(0xFFFFB300), fontSize: 9, fontWeight: FontWeight.bold)),
                                ),
                              ],
                              const Spacer(),
                              Text(
                                DateFormat('MMM d, h:mm a').format(post.createdAt),
                                style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            post.title,
                            style: AppTheme.poppinsBold(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          MarkdownBody(
                            data: post.content,
                            selectable: true,
                            styleSheet: MarkdownStyleSheet(
                              p: const TextStyle(color: Colors.white, fontSize: 14, height: 1.45),
                            ),
                            extensionSet: md.ExtensionSet(
                              [BlockMathSyntax(), ...md.ExtensionSet.gitHubFlavored.blockSyntaxes],
                              [InlineMathSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
                            ),
                            builders: {
                              'math': MathElementBuilder(),
                              'block_math': BlockMathElementBuilder(),
                            },
                          ),
                          const SizedBox(height: 16),
                          const Divider(color: Colors.white12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${post.replies.length} Peer Solutions & Replies',
                                style: AppTheme.poppinsBold(fontSize: 13, color: Colors.white70),
                              ),
                              InkWell(
                                onTap: () {
                                  HapticFeedback.selectionClick();
                                  setSheetState(() {
                                    if (post.isUpvoted) {
                                      post.upvotes--;
                                      post.isUpvoted = false;
                                    } else {
                                      post.upvotes++;
                                      post.isUpvoted = true;
                                    }
                                  });
                                  setState(() {});
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: post.isUpvoted ? AppTheme.secondary.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.05),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: post.isUpvoted ? AppTheme.secondary : Colors.transparent),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        post.isUpvoted ? Icons.thumb_up_alt_rounded : Icons.thumb_up_alt_outlined,
                                        size: 14,
                                        color: post.isUpvoted ? AppTheme.secondary : Colors.white70,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${post.upvotes}',
                                        style: TextStyle(
                                          color: post.isUpvoted ? AppTheme.secondary : Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          if (post.replies.isEmpty) ...[
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Center(
                                child: Text(
                                  'No solutions yet. Be the first to share your concept or shortcut!',
                                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                                ),
                              ),
                            ),
                          ] else ...[
                            ...post.replies.map((rep) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppTheme.background,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 11,
                                          backgroundColor: AppTheme.secondary.withValues(alpha: 0.25),
                                          child: Text(
                                            rep.authorName.isNotEmpty ? rep.authorName[0] : 'P',
                                            style: const TextStyle(color: AppTheme.secondary, fontSize: 10, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          rep.authorName,
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                        if (rep.isPro) ...[
                                          const SizedBox(width: 5),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFB300).withValues(alpha: 0.15),
                                              borderRadius: BorderRadius.circular(3),
                                            ),
                                            child: const Text('PRO', style: TextStyle(color: Color(0xFFFFB300), fontSize: 8, fontWeight: FontWeight.bold)),
                                          ),
                                        ],
                                        const Spacer(),
                                        Text(
                                          DateFormat('h:mm a').format(rep.createdAt),
                                          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    MarkdownBody(
                                      data: rep.content,
                                      selectable: true,
                                      styleSheet: MarkdownStyleSheet(
                                        p: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
                                      ),
                                      extensionSet: md.ExtensionSet(
                                        [BlockMathSyntax(), ...md.ExtensionSet.gitHubFlavored.blockSyntaxes],
                                        [InlineMathSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
                                      ),
                                      builders: {
                                        'math': MathElementBuilder(),
                                        'block_math': BlockMathElementBuilder(),
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          HapticFeedback.selectionClick();
                                          setSheetState(() {
                                            if (rep.isUpvoted) {
                                              rep.upvotes--;
                                              rep.isUpvoted = false;
                                            } else {
                                              rep.upvotes++;
                                              rep.isUpvoted = true;
                                            }
                                          });
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              rep.isUpvoted ? Icons.thumb_up_alt_rounded : Icons.thumb_up_alt_outlined,
                                              size: 13,
                                              color: rep.isUpvoted ? AppTheme.secondary : AppTheme.textSecondary,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${rep.upvotes}',
                                              style: TextStyle(
                                                color: rep.isUpvoted ? AppTheme.secondary : AppTheme.textSecondary,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1, color: Colors.white12),
                  const SizedBox(height: 8),
                  // Reply input
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: replyController,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                          decoration: InputDecoration(
                            hintText: 'Write a solution or explanation...',
                            hintStyle: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                            filled: true,
                            fillColor: AppTheme.background,
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: AppTheme.secondary,
                          foregroundColor: Colors.black,
                        ),
                        icon: const Icon(Icons.send_rounded, size: 18),
                        onPressed: () {
                          final text = replyController.text.trim();
                          if (text.isEmpty) return;
                          if (_containsSpam(text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Spam or external links detected.')),
                            );
                            return;
                          }

                          final newReply = CommunityReply(
                            id: 'rep_${DateTime.now().millisecondsSinceEpoch}',
                            authorName: 'You',
                            isPro: Provider.of<AppProvider>(context, listen: false).isPro,
                            content: text,
                            createdAt: DateTime.now(),
                          );

                          setSheetState(() {
                            post.replies.add(newReply);
                            post.replyCount++;
                          });
                          setState(() {});
                          replyController.clear();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter posts
    final filteredPosts = _posts.where((p) {
      if (_selectedChannel != '#All-Channels' && p.channel != _selectedChannel) {
        return false;
      }
      if (_searchQuery.isNotEmpty) {
        final q = _searchQuery.toLowerCase();
        if (!p.title.toLowerCase().contains(q) && !p.content.toLowerCase().contains(q)) {
          return false;
        }
      }
      if (_selectedFilter == 'Unresolved' && p.isSolved) return false;
      if (_selectedFilter == 'PRO Rankers' && !p.isPro) return false;
      return true;
    }).toList();

    if (_selectedFilter == 'Most Upvoted') {
      filteredPosts.sort((a, b) => b.upvotes.compareTo(a.upvotes));
    }

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Peer Learning & Doubts',
          style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: context.textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppTheme.accentPurple,
        onPressed: _openNewPostSheet,
        icon: const Icon(Icons.edit_note_rounded, color: Colors.white),
        label: const Text('Ask a Doubt', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Column(
        children: [
          // Channel selector strip
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              itemCount: _channels.length,
              itemBuilder: (context, index) {
                final ch = _channels[index];
                final isSelected = ch == _selectedChannel;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() {
                        _selectedChannel = ch;
                      });
                    },
                    child: NeuContainer(
                      isRecessed: isSelected,
                      borderRadius: 14,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Text(
                        ch,
                        style: TextStyle(
                          color: isSelected ? AppTheme.accentPurple : context.textSecondaryColor,
                          fontSize: 11.5,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Search and Filters
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
            child: Row(
              children: [
                Expanded(
                  child: NeuContainer(
                    isRecessed: true,
                    borderRadius: 14,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (val) => setState(() => _searchQuery = val.trim()),
                      style: TextStyle(color: context.textColor, fontSize: 13),
                      decoration: InputDecoration(
                        hintText: 'Search discussions or shortcuts...',
                        hintStyle: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                        prefixIcon: Icon(Icons.search, size: 16, color: context.textSecondaryColor),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  color: context.scaffoldBackground,
                  icon: NeuContainer(
                    borderRadius: 12,
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.filter_list_rounded, size: 18, color: AppTheme.accentPurple),
                  ),
                  onSelected: (val) => setState(() => _selectedFilter = val),
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'All', child: Text('All Doubts')),
                    const PopupMenuItem(value: 'Unresolved', child: Text('Unresolved Only')),
                    const PopupMenuItem(value: 'Most Upvoted', child: Text('Most Upvoted')),
                    const PopupMenuItem(value: 'PRO Rankers', child: Text('PRO Ranker Answers')),
                  ],
                ),
              ],
            ),
          ),

          // Discussions List
          Expanded(
            child: filteredPosts.isEmpty
                ? Center(
                    child: Text('No doubts found in this channel.', style: TextStyle(color: context.textSecondaryColor)),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(14, 4, 14, 80),
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredPosts.length,
                    itemBuilder: (context, index) {
                      final post = filteredPosts[index];
                      return _buildPostCard(context, post);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard(BuildContext context, CommunityPost post) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => _openThreadDetail(post),
        child: NeuContainer(
          borderRadius: 18,
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.accentPurple.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      post.channel,
                      style: const TextStyle(color: AppTheme.accentPurple, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (post.isSolved)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.accentMint.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle_rounded, size: 10, color: AppTheme.accentMint),
                          SizedBox(width: 3),
                          Text('SOLVED', style: TextStyle(color: AppTheme.accentMint, fontSize: 9, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  const Spacer(),
                  Text(
                    DateFormat('MMM d').format(post.createdAt),
                    style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                post.title,
                style: AppTheme.poppinsBold(fontSize: 14.5, color: context.textColor),
              ),
              const SizedBox(height: 6),
              MarkdownBody(
                data: post.content,
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(color: context.textSecondaryColor, fontSize: 13, height: 1.4),
                ),
                extensionSet: md.ExtensionSet(
                  [BlockMathSyntax(), ...md.ExtensionSet.gitHubFlavored.blockSyntaxes],
                  [InlineMathSyntax(), ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes],
                ),
                builders: {
                  'math': MathElementBuilder(),
                  'block_math': BlockMathElementBuilder(),
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: AppTheme.accentPurple.withValues(alpha: 0.2),
                    child: Text(
                      post.authorName.isNotEmpty ? post.authorName[0] : 'U',
                      style: const TextStyle(color: AppTheme.accentPurple, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    post.authorName,
                    style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                  ),
                  if (post.isPro) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.verified_rounded, size: 12, color: Color(0xFFFFB300)),
                  ],
                  const Spacer(),
                  // Upvotes
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() {
                        if (post.isUpvoted) {
                          post.upvotes--;
                          post.isUpvoted = false;
                        } else {
                          post.upvotes++;
                          post.isUpvoted = true;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      child: Row(
                        children: [
                          Icon(
                            post.isUpvoted ? Icons.thumb_up_alt_rounded : Icons.thumb_up_alt_outlined,
                            size: 13,
                            color: post.isUpvoted ? AppTheme.accentPurple : context.textSecondaryColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${post.upvotes}',
                            style: TextStyle(
                              color: post.isUpvoted ? AppTheme.accentPurple : context.textSecondaryColor,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Replies
                  Row(
                    children: [
                      Icon(Icons.mode_comment_outlined, size: 13, color: context.textSecondaryColor),
                      const SizedBox(width: 4),
                      Text(
                        '${post.replyCount}',
                        style: TextStyle(color: context.textSecondaryColor, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
