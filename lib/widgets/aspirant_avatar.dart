import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../theme/app_theme.dart';

class AspirantAvatarModel {
  final String id;
  final String name;
  final String emoji;
  final IconData fallbackIcon;
  final List<Color> gradientColors;
  final Color borderColor;
  final String title;

  const AspirantAvatarModel({
    required this.id,
    required this.name,
    required this.emoji,
    required this.fallbackIcon,
    required this.gradientColors,
    required this.borderColor,
    required this.title,
  });
}

class AspirantAvatars {
  static const List<AspirantAvatarModel> list = [
    AspirantAvatarModel(
      id: 'scholar',
      name: 'IIT Scholar',
      emoji: '🎓',
      fallbackIcon: Icons.school_rounded,
      gradientColors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
      borderColor: Color(0xFF818CF8),
      title: 'Top Tier Aspirant',
    ),
    AspirantAvatarModel(
      id: 'neural',
      name: 'AI Scientist',
      emoji: '🧠',
      fallbackIcon: Icons.psychology_rounded,
      gradientColors: [Color(0xFF0284C7), Color(0xFF06B6D4)],
      borderColor: Color(0xFF38BDF8),
      title: 'Neural Researcher',
    ),
    AspirantAvatarModel(
      id: 'ninja',
      name: 'Code Ninja',
      emoji: '🥷',
      fallbackIcon: Icons.terminal_rounded,
      gradientColors: [Color(0xFF059669), Color(0xFF10B981)],
      borderColor: Color(0xFF34D399),
      title: 'Algorithm Wizard',
    ),
    AspirantAvatarModel(
      id: 'rocket',
      name: 'Orbit Pioneer',
      emoji: '🚀',
      fallbackIcon: Icons.rocket_launch_rounded,
      gradientColors: [Color(0xFFDC2626), Color(0xFFEA580C)],
      borderColor: Color(0xFFF87171),
      title: 'Cosmic Aspirant',
    ),
    AspirantAvatarModel(
      id: 'speed',
      name: 'Speed Master',
      emoji: '⚡',
      fallbackIcon: Icons.bolt_rounded,
      gradientColors: [Color(0xFFD97706), Color(0xFFF59E0B)],
      borderColor: Color(0xFFFBBF24),
      title: 'High-Speed Solver',
    ),
    AspirantAvatarModel(
      id: 'trophy',
      name: 'AIR 1 Champion',
      emoji: '🏆',
      fallbackIcon: Icons.emoji_events_rounded,
      gradientColors: [Color(0xFFB45309), Color(0xFFF59E0B)],
      borderColor: Color(0xFFFCD34D),
      title: 'Rank Aspirant',
    ),
    AspirantAvatarModel(
      id: 'owl',
      name: 'Night Owl',
      emoji: '🦉',
      fallbackIcon: Icons.nights_stay_rounded,
      gradientColors: [Color(0xFF312E81), Color(0xFF4F46E5)],
      borderColor: Color(0xFF6366F1),
      title: 'Deep Focus',
    ),
    AspirantAvatarModel(
      id: 'hacker',
      name: 'Terminal Pro',
      emoji: '💻',
      fallbackIcon: Icons.code_rounded,
      gradientColors: [Color(0xFF0F766E), Color(0xFF14B8A6)],
      borderColor: Color(0xFF2DD4BF),
      title: 'Systems Architect',
    ),
    AspirantAvatarModel(
      id: 'target',
      name: 'Centurion',
      emoji: '🎯',
      fallbackIcon: Icons.track_changes_rounded,
      gradientColors: [Color(0xFFBE123C), Color(0xFFFB7185)],
      borderColor: Color(0xFFF43F5E),
      title: 'Bullseye Accuracy',
    ),
    AspirantAvatarModel(
      id: 'crown',
      name: 'Gate Emperor',
      emoji: '👑',
      fallbackIcon: Icons.workspace_premium_rounded,
      gradientColors: [Color(0xFF701A75), Color(0xFFA21CAF)],
      borderColor: Color(0xFFF472B6),
      title: 'Ultimate Mastery',
    ),
  ];

  static AspirantAvatarModel getAvatar(String? avatarId, String? seedName) {
    if (avatarId != null && avatarId.isNotEmpty) {
      final found = list.where((a) => a.id == avatarId);
      if (found.isNotEmpty) return found.first;
    }

    final clean = (seedName == null || seedName.trim().isEmpty)
        ? 'gate_aspirant'
        : seedName.trim().toLowerCase();
    int hash = 0;
    for (int i = 0; i < clean.length; i++) {
      hash = (hash * 31 + clean.codeUnitAt(i)) & 0x7FFFFFFF;
    }
    return list[hash % list.length];
  }
}

class AspirantAvatar extends StatelessWidget {
  final double size;
  final String? avatarId;
  final String? seedName;
  final VoidCallback? onTap;
  final bool showProBadge;
  final bool isPro;
  final bool showEditBadge;

  const AspirantAvatar({
    super.key,
    this.size = 52,
    this.avatarId,
    this.seedName,
    this.onTap,
    this.showProBadge = false,
    this.isPro = false,
    this.showEditBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    final avatar = AspirantAvatars.getAvatar(avatarId, seedName);

    Widget avatarCore = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: avatar.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(size * 0.38),
        border: Border.all(
          color: avatar.borderColor.withValues(alpha: 0.65),
          width: size >= 48 ? 1.6 : 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: avatar.gradientColors.first.withValues(alpha: 0.38),
            blurRadius: size * 0.22,
            offset: Offset(0, size * 0.08),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        avatar.emoji,
        style: TextStyle(
          fontSize: size * 0.52,
          height: 1.1,
        ),
      ),
    );

    if (showProBadge && isPro) {
      avatarCore = Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          avatarCore,
          Positioned(
            right: -2,
            bottom: -2,
            child: Container(
              padding: EdgeInsets.all(size * 0.05),
              decoration: BoxDecoration(
                color: const Color(0xFFFFB300),
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.isDarkMode ? const Color(0xFF1E1E26) : Colors.white,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFB300).withValues(alpha: 0.4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                Icons.workspace_premium_rounded,
                size: size * 0.22,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    } else if (showEditBadge) {
      avatarCore = Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          avatarCore,
          Positioned(
            right: -2,
            bottom: -2,
            child: Container(
              padding: EdgeInsets.all(size * 0.06),
              decoration: BoxDecoration(
                color: AppTheme.accentPurple,
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.isDarkMode ? const Color(0xFF1E1E26) : Colors.white,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.edit_rounded,
                size: size * 0.20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    }

    if (onTap != null) {
      return GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap!();
        },
        child: avatarCore,
      );
    }

    return avatarCore;
  }
}

/// Bottom Sheet modal allowing user to pick an avatar or keep it automatic
void showAspirantAvatarPicker(BuildContext context) {
  HapticFeedback.mediumImpact();
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (modalContext) {
      return Consumer<AppProvider>(
        builder: (context, provider, _) {
          final currentAvatarId = provider.userAvatarId;

          return Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.78,
            ),
            decoration: BoxDecoration(
              color: context.isDarkMode ? const Color(0xFF16151D) : Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
              border: Border.all(
                color: context.isDarkMode ? Colors.white12 : Colors.black12,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                // Handle Bar
                Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.isDarkMode ? Colors.white24 : Colors.black26,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),

                // Title & Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppTheme.accentPurple.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.face_retouching_natural_rounded,
                          color: AppTheme.accentPurple,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aspirant Avatar Studio',
                              style: GoogleFonts.outfit(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: context.textColor,
                              ),
                            ),
                            Text(
                              currentAvatarId == null
                                  ? 'Automatic (Assigned from your name)'
                                  : 'Custom Avatar Selected',
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                color: context.textSecondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Divider(
                  height: 1,
                  color: context.isDarkMode ? Colors.white10 : Colors.black12,
                ),

                // Grid of Avatars
                Flexible(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(18),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2.1,
                    ),
                    itemCount: AspirantAvatars.list.length,
                    itemBuilder: (context, index) {
                      final item = AspirantAvatars.list[index];
                      final isSelected = currentAvatarId == item.id;

                      return GestureDetector(
                        onTap: () {
                          HapticFeedback.selectionClick();
                          provider.setUserAvatarId(item.id);
                          Navigator.pop(modalContext);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Avatar updated to ${item.name}! ${item.emoji}'),
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(seconds: 2),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? item.gradientColors.first.withValues(alpha: 0.18)
                                : (context.isDarkMode ? const Color(0xFF201E28) : const Color(0xFFF7F8FC)),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? item.borderColor
                                  : (context.isDarkMode ? Colors.white.withValues(alpha: 0.08) : Colors.black.withValues(alpha: 0.06)),
                              width: isSelected ? 1.8 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: item.gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  item.emoji,
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.outfit(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: context.textColor,
                                      ),
                                    ),
                                    Text(
                                      item.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.outfit(
                                        fontSize: 10.5,
                                        color: context.textSecondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelected)
                                Icon(
                                  Icons.check_circle_rounded,
                                  size: 18,
                                  color: item.borderColor,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Reset to Automatic Button
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    18,
                    4,
                    18,
                    16 + MediaQuery.of(context).padding.bottom,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            HapticFeedback.selectionClick();
                            provider.setUserAvatarId(null);
                            Navigator.pop(modalContext);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Reset avatar to Automatic (derived from name) 🎯'),
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            );
                          },
                          icon: const Icon(Icons.auto_awesome_rounded, size: 16),
                          label: const Text('Reset to Automatic (Name Hash)'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: context.textSecondaryColor,
                            side: BorderSide(
                              color: context.isDarkMode ? Colors.white24 : Colors.black26,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
