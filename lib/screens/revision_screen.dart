import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';
import '../models/models.dart';

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
      // High -> Medium -> Low
      sorted.sort((a, b) {
        final aVal = a.priority == 'High' ? 3 : (a.priority == 'Medium' ? 2 : 1);
        final bVal = b.priority == 'High' ? 3 : (b.priority == 'Medium' ? 2 : 1);
        return bVal.compareTo(aVal); // descending priority value
      });
    } else if (_sortBy == 'subject') {
      sorted.sort((a, b) => a.subject.compareTo(b.subject));
    } else if (_sortBy == 'date') {
      sorted.sort((a, b) => b.dateFlagged.compareTo(a.dateFlagged)); // newest first
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
      appBar: AppBar(
        title: const Text('Revision Queue'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              'Spaced Revision Queue',
              style: AppTheme.poppinsBold(fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              'Topics and questions flagged for review. Items are prioritized based on time elapsed since they were last revised.',
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
            ),
          ),
          const SizedBox(height: 12),

          // Sorting Chips Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Text(
                  'Sort by: ',
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                _buildSortChip('Priority', 'priority'),
                const SizedBox(width: 8),
                _buildSortChip('Subject', 'subject'),
                const SizedBox(width: 8),
                _buildSortChip('Date Added', 'date'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // List View
          Expanded(
            child: sortedItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.autorenew_rounded, size: 60, color: AppTheme.secondary.withOpacity(0.5)),
                        const SizedBox(height: 16),
                        const Text(
                          'Your revision queue is empty!',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Flag topics or questions in the Roadmap & PYQ screens.',
                          style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    physics: const BouncingScrollPhysics(),
                    itemCount: sortedItems.length,
                    itemBuilder: (context, index) {
                      final item = sortedItems[index];
                      final elapsed = DateTime.now().difference(item.lastRevised ?? item.dateFlagged).inDays;
                      final priorityColor = _getPriorityColor(item.priority);

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
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
                                      color: priorityColor.withOpacity(0.15),
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
                                        color: AppTheme.primary.withOpacity(0.12),
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
                              const SizedBox(height: 12),

                              // Topic Name
                              Text(
                                item.topic,
                                style: AppTheme.poppinsBold(fontSize: 16),
                              ),
                              const SizedBox(height: 8),

                              // Metadata
                              Row(
                                children: [
                                  Icon(Icons.calendar_today_outlined, size: 14, color: AppTheme.textSecondary),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Flagged: ${DateFormat('MMM dd, yyyy').format(item.dateFlagged)}',
                                    style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                                  ),
                                  const Spacer(),
                                  Text(
                                    elapsed == 0
                                        ? 'Revised today'
                                        : (elapsed == 1 ? '1 day since revised' : '$elapsed days since revised'),
                                    style: TextStyle(
                                      color: elapsed >= 3 ? AppTheme.error : AppTheme.textSecondary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Divider(height: 1, color: AppTheme.textSecondary),
                              const SizedBox(height: 8),

                              // Mark complete button
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppTheme.secondary,
                                  ),
                                  onPressed: () {
                                    provider.markRevisionItemCompleted(item.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Topic revision complete! Updated intervals.'),
                                        backgroundColor: AppTheme.success,
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.check_circle_outline, size: 18),
                                  label: const Text(
                                    'Mark Revised',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
    return ChoiceChip(
      selected: isSelected,
      label: Text(label),
      labelStyle: TextStyle(
        color: isSelected ? AppTheme.background : AppTheme.textPrimary,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        fontSize: 11,
      ),
      selectedColor: AppTheme.secondary,
      backgroundColor: AppTheme.surface,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _sortBy = value;
          });
        }
      },
    );
  }
}
