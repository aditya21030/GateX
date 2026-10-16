import 'package:gate_da/data/sample_pyqs.dart';
import 'package:gate_da/screens/mock_tracker_screen.dart';

void main() {
  print('Running _generateSubjectMock simulation...');
  final subject = 'Linear Algebra';
  final pool = samplePYQs
      .where((q) => q.subject == subject)
      .map((q) => transformToMockQuestion(q))
      .toList();
  
  print('Pool size for $subject: ${pool.length}');
  for (var q in pool) {
    print('ID: ${q.id}, Subject: ${q.subject}, Topic: ${q.topic}');
  }
}
