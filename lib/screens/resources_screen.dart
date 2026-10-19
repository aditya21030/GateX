import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../theme/app_theme.dart';
import '../widgets/neu_widgets.dart';
import 'formula_sheet_screen.dart';
import 'weightage_screen.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'Revision Resources & Guides',
          style: AppTheme.poppinsBold(fontSize: 17, color: context.textColor),
        ),
        elevation: 0,
        backgroundColor: context.scaffoldBackground,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. HERO HEADER
            NeuContainer(
              borderRadius: 20,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const NeuIconTile(
                    icon: Icons.menu_book_rounded,
                    iconColor: AppTheme.primary,
                    size: 44,
                    iconSize: 22,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Formula & Cheat Sheets',
                          style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'Curated formulas, probability tables, and rapid recall sheets for revision.',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: context.textSecondaryColor,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 2. CORE FORMULA REFERENCE SHORTCUT
            NeuContainer(
              borderRadius: 20,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const NeuIconTile(
                    icon: Icons.functions_rounded,
                    iconColor: AppTheme.secondary,
                    size: 44,
                    iconSize: 22,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Interactive Formula Book',
                          style: AppTheme.poppinsBold(fontSize: 14, color: context.textColor),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '1,500+ formulas with full derivations for DA and CS/IT.',
                          style: TextStyle(fontSize: 11, color: context.textSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                  NeuButton(
                    isPrimary: true,
                    borderRadius: 12,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const FormulaSheetScreen()));
                    },
                    child: const Text('OPEN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 3. CURATED QUICK-STUDY CARDS
            Text(
              'HIGH-YIELD REVISION GUIDES',
              style: TextStyle(
                color: context.textSecondaryColor,
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
            const SizedBox(height: 20),

            // 4. SHARE TOOL
            NeuButton(
              borderRadius: 14,
              padding: const EdgeInsets.symmetric(vertical: 14),
              onPressed: () {
                Share.share(
                  'Preparing for GATE DA / CSIT? Check out GateX for high-yield formula sheets, past year questions with LaTeX solutions, and full CBT mock tests: https://play.google.com/store/apps/details?id=com.gatex.gateda',
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share_outlined, size: 16, color: context.textColor),
                  const SizedBox(width: 8),
                  Text('Share Study Guides with Friends', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: context.textColor)),
                ],
              ),
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
    return GestureDetector(
      onTap: onTap,
      child: NeuContainer(
        borderRadius: 18,
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NeuIconTile(
              icon: icon,
              iconColor: iconColor,
              size: 40,
              iconSize: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.poppinsBold(fontSize: 13.5, color: context.textColor),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 11, color: context.textSecondaryColor, height: 1.3),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Icon(Icons.chevron_right_rounded, color: context.textSecondaryColor, size: 18),
          ],
        ),
      ),
    );
  }

  void _showDistributionModal(BuildContext context) {
    _showSheetModal(
      context,
      title: 'Probability Distributions',
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
          title: 'Regression Metrics',
          details: '• MSE = (1/n) ∑ (y_i - ŷ_i)²\n• RMSE = sqrt(MSE)\n• MAE = (1/n) ∑ |y_i - ŷ_i|\n• R² Score = 1 - (SS_res / SS_tot)',
        ),
        (
          title: 'Bias-Variance Tradeoff',
          details: '• Total Error = Bias² + Variance + Irreducible Error (σ²)\n• High Bias: Underfitting. Solution: Add features, increase model complexity.\n• High Variance: Overfitting. Solution: More data, regularization (L1/L2), reduce features.',
        ),
        (
          title: 'Regularization (L1 vs L2)',
          details: '• L1 (Lasso): Loss + λ ∑|w_i|. Induces sparsity (feature selection).\n• L2 (Ridge): Loss + λ ∑(w_i)². Shrinks weights towards zero smoothly.',
        ),
      ],
    );
  }

  void _showCalculusModal(BuildContext context) {
    _showSheetModal(
      context,
      title: 'Calculus & Optimization',
      items: const [
        (
          title: 'Gradient & Directional Derivative',
          details: '• Gradient ∇f = [∂f/∂x₁, ∂f/∂x₂, ..., ∂f/∂x_n]^T\n• Direction of steepest ascent: ∇f(x)\n• Direction of steepest descent: -∇f(x)\n• Directional derivative in direction u: D_u f = ∇f · u (where |u| = 1)',
        ),
        (
          title: 'Hessian Matrix & Curvature',
          details: '• H_ij = ∂²f / (∂x_i ∂x_j)\n• Symmetric if second derivatives are continuous.\n• H is Positive Definite (all eigenvalues > 0) => Local Minimum\n• H is Negative Definite (all eigenvalues < 0) => Local Maximum\n• H is Indefinite (both positive and negative eigenvalues) => Saddle Point',
        ),
        (
          title: 'Convexity Conditions',
          details: '• f is convex iff f(λx + (1-λ)y) ≤ λf(x) + (1-λ)f(y) for λ ∈ [0, 1]\n• First-order condition: f(y) ≥ f(x) + ∇f(x)^T (y - x)\n• Second-order condition: Hessian H(x) ≥ 0 (positive semi-definite) everywhere.',
        ),
        (
          title: 'Taylor Series Expansion (Multivariable)',
          details: 'f(x + Δx) ≈ f(x) + ∇f(x)^T Δx + (1/2) Δx^T H(x) Δx',
        ),
        (
          title: 'Gradient Descent Convergence',
          details: '• Update rule: x_{t+1} = x_t - η ∇f(x_t)\n• Learning rate too high: Diverges\n• Learning rate too low: Slow convergence\n• For convex L-smooth functions, converges with rate O(1/t) with η ≤ 1/L.',
        ),
      ],
    );
  }

  void _showLossFunctionsModal(BuildContext context) {
    _showSheetModal(
      context,
      title: 'Loss Functions & Gradients',
      items: const [
        (
          title: 'Mean Squared Error (MSE)',
          details: '• Formula: L = (1/2) (y - ŷ)²\n• Gradient: ∂L/∂ŷ = -(y - ŷ)\n• Note: Convex, differentiable, sensitive to outliers.',
        ),
        (
          title: 'Binary Cross-Entropy (BCE / Log Loss)',
          details: '• Formula: L = -[y ln(ŷ) + (1-y) ln(1-ŷ)]\n• When paired with Sigmoid (ŷ = σ(z)): ∂L/∂z = ŷ - y\n• Note: Heavily penalizes confident wrong predictions.',
        ),
        (
          title: 'Categorical Cross-Entropy',
          details: '• Formula: L = -∑ y_c ln(ŷ_c)\n• When paired with Softmax (ŷ_c = exp(z_c)/∑ exp(z_j)): ∂L/∂z_k = ŷ_k - y_k\n• Used for multi-class classification.',
        ),
        (
          title: 'Hinge Loss (SVM)',
          details: '• Formula: L = max(0, 1 - y * ŷ) where y ∈ {-1, +1}\n• Zero loss when prediction is correct and beyond margin (y*ŷ ≥ 1).\n• Sub-gradient: -y if y*ŷ < 1, else 0.',
        ),
        (
          title: 'KL Divergence (Relative Entropy)',
          details: '• D_KL(P || Q) = ∑ P(x) ln(P(x) / Q(x))\n• Non-negative: D_KL(P || Q) ≥ 0 (Gibbs inequality)\n• Asymmetric: D_KL(P || Q) ≠ D_KL(Q || P)',
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
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: context.scaffoldBackground,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(20),
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: context.textSecondaryColor.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTheme.poppinsBold(fontSize: 16, color: context.textColor),
                        ),
                      ),
                      NeuButton(
                        borderRadius: 10,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        onPressed: () {
                          final buffer = StringBuffer();
                          buffer.writeln('📚 GATE DA Revision Sheet: $title\n');
                          for (final it in items) {
                            buffer.writeln('▪ ${it.title}');
                            buffer.writeln('${it.details}\n');
                          }
                          buffer.writeln('Shared via GateX');
                          Share.share(buffer.toString());
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.share_rounded, size: 14, color: AppTheme.secondary),
                            SizedBox(width: 4),
                            Text('Share', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.secondary)),
                          ],
                        ),
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
    return NeuContainer(
      margin: const EdgeInsets.only(bottom: 12),
      borderRadius: 14,
      padding: const EdgeInsets.all(14),
      isRecessed: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.secondary)),
          const SizedBox(height: 6),
          Text(details, style: TextStyle(fontSize: 12, color: context.textColor, height: 1.4)),
        ],
      ),
    );
  }
}
