import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';
import '../widgets/neu_widgets.dart';

class RevisionScreen extends StatefulWidget {
  const RevisionScreen({super.key});

  @override
  State<RevisionScreen> createState() => _RevisionScreenState();
}

class _RevisionScreenState extends State<RevisionScreen> {
  String _sortBy = 'priority'; // priority, subject, date

  List<RevisionItem> _sortItems(List<RevisionItem> items) {
    List<RevisionItem> sorted = List.from(items);
    if (_sortBy == 'priority') {
      sorted.sort((a, b) {
        final aVal = a.priority == 'High' ? 3 : (a.priority == 'Medium' ? 2 : 1);
        final bVal = b.priority == 'High' ? 3 : (b.priority == 'Medium' ? 2 : 1);
        return bVal.compareTo(aVal);
      });
    } else if (_sortBy == 'subject') {
      sorted.sort((a, b) => a.subject.compareTo(b.subject));
    } else if (_sortBy == 'date') {
      sorted.sort((a, b) => b.dateFlagged.compareTo(a.dateFlagged));
    }
    return sorted;
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return AppTheme.error;
      case 'Medium':
        return Colors.amber;
      case 'Low':
        return AppTheme.success;
      default:
        return AppTheme.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final sortedItems = _sortItems(provider.revisionQueue);

    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text('Revision Queue', style: AppTheme.poppinsBold(fontSize: 18, color: context.textColor)),
        backgroundColor: context.scaffoldBackground,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header card
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: NeuContainer(
              borderRadius: 18,
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  const NeuIconTile(
                    icon: Icons.autorenew_rounded,
                    iconColor: AppTheme.secondary,
                    size: 40,
                    iconSize: 22,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Spaced Repetition Queue',
                          style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${sortedItems.length} topic${sortedItems.length == 1 ? "" : "s"} scheduled for active recall',
                          style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Sorting Chips Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              children: [
                Text(
                  'Sort: ',
                  style: TextStyle(color: context.textSecondaryColor, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                _buildSortChip('Priority', 'priority'),
                const SizedBox(width: 8),
                _buildSortChip('Subject', 'subject'),
                const SizedBox(width: 8),
                _buildSortChip('Date', 'date'),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // List View
          Expanded(
            child: sortedItems.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const NeuIconTile(
                            icon: Icons.check_circle_outline_rounded,
                            iconColor: AppTheme.success,
                            size: 64,
                            iconSize: 32,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'All Caught Up!',
                            style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Flag topics or questions in Roadmap & PYQ screens to review them here.',
                            style: TextStyle(color: context.textSecondaryColor, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    physics: const BouncingScrollPhysics(),
                    itemCount: sortedItems.length,
                    itemBuilder: (context, index) {
                      final item = sortedItems[index];
                      final elapsed = DateTime.now().difference(item.lastRevised ?? item.dateFlagged).inDays;
                      final priorityColor = _getPriorityColor(item.priority);

                      return NeuContainer(
                        borderRadius: 18,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Priority & Subject Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: priorityColor.withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '${item.priority} Priority',
                                    style: TextStyle(color: priorityColor, fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primary.withValues(alpha: 0.12),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      item.subject,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(color: AppTheme.primary, fontSize: 10, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Topic Name
                            Text(
                              item.topic,
                              style: AppTheme.poppinsBold(fontSize: 15, color: context.textColor),
                            ),
                            const SizedBox(height: 8),

                            // Metadata
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined, size: 13, color: context.textSecondaryColor),
                                const SizedBox(width: 6),
                                Text(
                                  'Flagged: ${DateFormat('MMM dd').format(item.dateFlagged)}',
                                  style: TextStyle(color: context.textSecondaryColor, fontSize: 11),
                                ),
                                const Spacer(),
                                Text(
                                  elapsed == 0
                                      ? 'Revised today'
                                      : (elapsed == 1 ? '1 day ago' : '$elapsed days ago'),
                                  style: TextStyle(
                                    color: elapsed >= 3 ? AppTheme.error : context.textSecondaryColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Mark complete button
                            Align(
                              alignment: Alignment.centerRight,
                              child: NeuButton(
                                isPrimary: true,
                                borderRadius: 12,
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                onPressed: () {
                                  provider.markRevisionItemCompleted(item.id);
                                  ScaffoldMessenger.of(context).clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Topic revision complete! Interval updated.'),
                                      backgroundColor: AppTheme.success,
                                      duration: Duration(seconds: 1),
                                    ),
                                  );
                                },
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check_rounded, size: 16, color: Colors.white),
                                    SizedBox(width: 6),
                                    Text('Mark Revised', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortChip(String label, String value) {
    final isSelected = _sortBy == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _sortBy = value;
        });
      },
      child: NeuContainer(
        isRecessed: isSelected,
        borderRadius: 12,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppTheme.secondary : context.textColor,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
