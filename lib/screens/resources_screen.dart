import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../theme/app_theme.dart';
import 'formula_sheet_screen.dart';
import 'weightage_screen.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Revision Resources & Guides'),
        elevation: 0,
        backgroundColor: AppTheme.surface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. HERO HEADER
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade900, Colors.deepPurple.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withValues(alpha: 0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.library_books_rounded, size: 44, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'High-Yield Cheat Sheets',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Essential formula summaries, distribution tables, and rapid review guides tailored for the final 90 days.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.9),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. CORE FORMULA REFERENCE SHORTCUT
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.secondary.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.secondary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.functions_rounded, color: AppTheme.secondary, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Interactive Formula Book',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '1,500+ formulas with full derivations for DA and CS/IT.',
                          style: TextStyle(fontSize: 11, color: AppTheme.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.secondary,
                      foregroundColor: AppTheme.background,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FormulaSheetScreen()));
                    },
                    child: const Text('OPEN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 3. CURATED QUICK-STUDY CARDS
            const Text(
              'HIGH-YIELD REVISION GUIDES',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),

            _buildGuideCard(
              context,
              icon: Icons.analytics_outlined,
              iconColor: Colors.amber,
              title: 'Probability Distributions Cheat Sheet',
              subtitle: 'PMF/PDF, Mean, Variance, MGF, & Memoryless Properties for Uniform, Binomial, Poisson, Normal, & Exponential.',
              onTap: () => _showDistributionModal(context),
            ),
            const SizedBox(height: 12),

            _buildGuideCard(
              context,
              icon: Icons.grid_on_rounded,
              iconColor: Colors.blueAccent,
              title: 'Linear Algebra Quick Reference',
              subtitle: 'Eigenvalue properties, Trace-Determinant identities, SVD decomposition, and Projection matrix formulas.',
              onTap: () => _showLinearAlgebraModal(context),
            ),
            const SizedBox(height: 12),

            _buildGuideCard(
              context,
              icon: Icons.psychology_outlined,
              iconColor: Colors.teal,
              title: 'ML Metrics & Evaluation Table',
              subtitle: 'Confusion Matrix, Precision, Recall, F1-Score, ROC-AUC, Bias-Variance Tradeoff, and L1 vs L2 regularization.',
              onTap: () => _showMLModal(context),
            ),
            const SizedBox(height: 12),

            _buildGuideCard(
              context,
              icon: Icons.functions_rounded,
              iconColor: Colors.deepPurpleAccent,
              title: 'Calculus & Optimization Super-Sheet',
              subtitle: 'Gradients, Hessian matrix, convexity conditions, Taylor expansion, and Gradient Descent update rules.',
              onTap: () => _showCalculusModal(context),
            ),
            const SizedBox(height: 12),

            _buildGuideCard(
              context,
              icon: Icons.alt_route_rounded,
              iconColor: Colors.cyanAccent,
              title: 'ML Loss Functions & Gradients',
              subtitle: 'MSE, Binary Cross-Entropy, Categorical Cross-Entropy, Softmax Jacobian, and SVM Hinge loss derivations.',
              onTap: () => _showLossFunctionsModal(context),
            ),
            const SizedBox(height: 12),

            _buildGuideCard(
              context,
              icon: Icons.bar_chart_rounded,
              iconColor: Colors.orange,
              title: 'Expected Subject Weightage Map',
              subtitle: 'Detailed topic prioritization based on 2024-2026 actual marks distribution.',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WeightageScreen()));
              },
            ),
            const SizedBox(height: 28),

            // 4. SHARE TOOL
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.share_outlined, size: 18),
              label: const Text('Share Study Guides with Friends'),
              onPressed: () {
                Share.share(
                  'Preparing for GATE DA / CSIT? Check out GateX for high-yield formula sheets, past year questions with LaTeX solutions, and full CBT mock tests: https://play.google.com/store/apps/details?id=com.gatex.gateda',
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildGuideCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary, height: 1.3),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: AppTheme.textSecondary, size: 14),
          ],
        ),
      ),
    );
  }

  void _showDistributionModal(BuildContext context) {
    _showSheetModal(
      context,
      title: 'Probability Distributions Quick Reference',
      items: const [
        (
          title: 'Bernoulli Distribution',
          details: '• PMF: P(X=1) = p, P(X=0) = 1-p\n• Mean = p\n• Variance = p(1-p)\n• MGF: M_X(t) = (1-p) + p*e^t',
        ),
        (
          title: 'Binomial Distribution B(n, p)',
          details: '• PMF: P(X=k) = nCk * p^k * (1-p)^(n-k)\n• Mean = np\n• Variance = np(1-p)\n• Mode: floor((n+1)p) if (n+1)p is not an integer.',
        ),
        (
          title: 'Poisson Distribution (λ)',
          details: '• PMF: P(X=k) = (e^-λ * λ^k) / k!\n• Mean = λ, Variance = λ\n• Property: Sum of independent Poisson variables is Poisson (λ1 + λ2).',
        ),
        (
          title: 'Normal Distribution N(μ, σ²)',
          details: '• Standard Normal: Z = (X - μ) / σ ~ N(0, 1)\n• 68-95-99.7 Rule: P(μ±σ) ≈ 68.27%, P(μ±2σ) ≈ 95.45%, P(μ±3σ) ≈ 99.73%\n• Linear combo: aX + bY ~ N(aμ_X + bμ_Y, a²σ_X² + b²σ_Y² + 2ab*Cov(X,Y))',
        ),
        (
          title: 'Exponential Distribution (λ)',
          details: '• PDF: f(x) = λe^(-λx) for x ≥ 0\n• CDF: F(x) = 1 - e^(-λx)\n• Mean = 1/λ, Variance = 1/λ²\n• Memoryless Property: P(X > s + t | X > s) = P(X > t)',
        ),
        (
          title: 'Uniform Distribution U(a, b)',
          details: '• PDF: f(x) = 1 / (b - a) for a ≤ x ≤ b\n• Mean = (a + b) / 2\n• Variance = (b - a)² / 12',
        ),
      ],
    );
  }

  void _showLinearAlgebraModal(BuildContext context) {
    _showSheetModal(
      context,
      title: 'Linear Algebra Matrix Identities',
      items: const [
        (
          title: 'Trace & Determinant Rules',
          details: '• Trace(A) = Sum of diagonal elements = Sum of Eigenvalues (∑ λ_i)\n• Det(A) = Product of Eigenvalues (∏ λ_i)\n• Det(AB) = Det(A) * Det(B)\n• Det(cA) = c^n * Det(A) for n×n matrix',
        ),
        (
          title: 'Eigenvalue Transformations',
          details: '• A has eigenvalues λ_i\n• A^k has eigenvalues λ_i^k\n• A^-1 has eigenvalues 1/λ_i (iff Det(A) ≠ 0)\n• A + cI has eigenvalues λ_i + c',
        ),
        (
          title: 'Rank-Nullity Theorem',
          details: 'For any m×n matrix A:\nRank(A) + Nullity(A) = n (number of columns)',
        ),
        (
          title: 'Symmetric & Orthogonal Matrices',
          details: '• Symmetric (A = A^T): All eigenvalues are real. Eigenvectors for distinct eigenvalues are strictly orthogonal.\n• Orthogonal (A^T * A = I): All eigenvalues have |λ| = 1. Det(A) = ±1.',
        ),
        (
          title: 'Singular Value Decomposition (SVD)',
          details: 'A = U Σ V^T\n• U (m×m): Eigenvectors of A A^T (Left singular vectors)\n• V (n×n): Eigenvectors of A^T A (Right singular vectors)\n• Σ: Diagonal matrix of singular values σ_i = sqrt(λ_i(A^T A))',
        ),
      ],
    );
  }

  void _showMLModal(BuildContext context) {
    _showSheetModal(
      context,
      title: 'Machine Learning Evaluation Metrics',
      items: const [
        (
          title: 'Classification Metrics',
          details: '• Precision = TP / (TP + FP) [Minimizes False Positives]\n• Recall (Sensitivity) = TP / (TP + FN) [Minimizes False Negatives]\n• F1-Score = 2 * (Precision * Recall) / (Precision + Recall)\n• Specificity = TN / (TN + FP)',
        ),
        (
          title: 'ROC Curve & AUC Score',
          details: '• ROC curve plots True Positive Rate (Sensitivity) vs False Positive Rate (1 - Specificity).\n• AUC = 1.0 (Perfect model), AUC = 0.5 (Random guessing).',
        ),
        (
          title: 'L1 (Lasso) vs L2 (Ridge) Regularization',
          details: '• L1 Penalty = λ * ∑|w_i| -> Produces sparse weights, performs feature selection.\n• L2 Penalty = λ * ∑w_i² -> Shrinks weights toward zero, handles multicollinearity.',
        ),
        (
          title: 'Bias-Variance Decomposition',
          details: 'Total Expected Error = Bias² + Variance + Irreducible Error (Noise)\n• High Bias: Underfitting (model too simplistic)\n• High Variance: Overfitting (model captures noise in train set)',
        ),
      ],
    );
  }

  void _showCalculusModal(BuildContext context) {
    _showSheetModal(
      context,
      title: 'Calculus & Optimization Super-Sheet',
      items: const [
        (
          title: 'Gradient & Directional Derivative',
          details: '• Gradient ∇f = [∂f/∂x1, ∂f/∂x2, ..., ∂f/∂xn]^T\n• Direction of steepest ascent = ∇f / ||∇f||\n• Directional derivative in direction u: D_u f = ∇f · u',
        ),
        (
          title: 'Hessian Matrix & Convexity Test',
          details: '• Hessian H_ij = ∂²f / (∂xi ∂xj)\n• A function f is convex iff H is Positive Semi-Definite (all eigenvalues λ_i ≥ 0).\n• Strictly convex iff H is Positive Definite (all λ_i > 0) -> Unique global minimum!',
        ),
        (
          title: 'Critical Points Classification',
          details: 'At stationary point ∇f(x*) = 0:\n• H > 0 (Positive Definite) => Local Minimum\n• H < 0 (Negative Definite) => Local Maximum\n• H has both positive and negative eigenvalues => Saddle Point',
        ),
        (
          title: 'Gradient Descent Convergence',
          details: '• Update: θ_{t+1} = θ_t - η ∇f(θ_t)\n• Learning rate η must satisfy 0 < η < 2/L where L is Lipschitz constant of ∇f.\n• Momentum update: v_{t+1} = β v_t + η ∇f(θ_t), θ_{t+1} = θ_t - v_{t+1}',
        ),
        (
          title: 'Taylor Series Expansion (Multivariable)',
          details: 'f(x + Δx) ≈ f(x) + ∇f(x)^T Δx + (1/2) Δx^T H(x) Δx',
        ),
      ],
    );
  }

  void _showLossFunctionsModal(BuildContext context) {
    _showSheetModal(
      context,
      title: 'ML Loss Functions & Gradients',
      items: const [
        (
          title: 'Mean Squared Error (MSE / L2 Loss)',
          details: '• L(y, ŷ) = (1/2n) ∑ (y_i - ŷ_i)²\n• Gradient: ∂L/∂ŷ = -(y - ŷ)\n• Properties: Smooth, differentiable everywhere; sensitive to outliers.',
        ),
        (
          title: 'Binary Cross-Entropy (Log Loss)',
          details: '• L(y, p) = - [ y log(p) + (1-y) log(1-p) ]\n• For logistic regression p = σ(z): ∂L/∂z = p - y\n• Convex optimization problem with guaranteed global minimum.',
        ),
        (
          title: 'Categorical Cross-Entropy & Softmax',
          details: '• Softmax: p_i = e^(z_i) / ∑ e^(z_j)\n• Loss: L = - ∑ y_i log(p_i)\n• Gradient: ∂L/∂z_i = p_i - y_i (elegant residual subtraction)',
        ),
        (
          title: 'Hinge Loss (Support Vector Machines)',
          details: '• L(y, f(x)) = max(0, 1 - y * f(x))  where y ∈ {-1, +1}\n• Zero loss if y*f(x) ≥ 1 (correct and beyond margin)\n• Subgradient: -y*x if y*f(x) < 1, else 0',
        ),
      ],
    );
  }

  void _showSheetModal(
    BuildContext context, {
    required String title,
    required List<({String title, String details})> items,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.surface,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.72,
          minChildSize: 0.4,
          maxChildSize: 0.94,
          expand: false,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
                        ),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: AppTheme.secondary,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          backgroundColor: AppTheme.secondary.withValues(alpha: 0.12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: const Icon(Icons.share_rounded, size: 15),
                        label: const Text('Share', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          final buffer = StringBuffer();
                          buffer.writeln('📚 GATE DA Revision Sheet: $title\n');
                          for (final it in items) {
                            buffer.writeln('▪ ${it.title}');
                            buffer.writeln('${it.details}\n');
                          }
                          buffer.writeln('Shared via GateX (GATE DA Prep App)');
                          Share.share(buffer.toString());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...items.map((it) => _InfoItem(title: it.title, details: it.details)),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String details;

  const _InfoItem({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.secondary)),
          const SizedBox(height: 6),
          Text(details, style: const TextStyle(fontSize: 12, color: Colors.white, height: 1.4)),
        ],
      ),
    );
  }
}
