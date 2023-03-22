import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportService {
  Future<void> launchEmail(
      {String email = 'radiantxtechnologies@gmail.com',
      String subject = 'Support'}) async {
    final url = Uri.parse('mailto:$email?subject=${Uri.encodeFull(subject)}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Future<void> launchPhone() async {
    final Uri url = Uri(
      scheme: 'tel',
      path: '+2348164080455',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  Future<void> launchChat() async {
    final Uri url = Uri(
      scheme: 'https',
      path: 'wa.me/+2348164080455',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}

final supportServiceProvider =
    Provider<SupportService>((ref) => SupportService());
