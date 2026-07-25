import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDateHeader(context, 'Today'),
          _buildTransactionItem(context, 'Received BTC', 'From: 0x123...abc', '+\$450.00', true),
          _buildTransactionItem(context, 'Sent ETH', 'To: 0x456...def', '-\$120.00', false),
          const SizedBox(height: 16),
          _buildDateHeader(context, 'Yesterday'),
          _buildTransactionItem(context, 'Swapped SOL to USDC', 'Raydium', '+\$500.00', true),
          _buildTransactionItem(context, 'Bought ADA', 'Credit Card', '+\$250.00', true),
        ],
      ),
    );
  }

  Widget _buildDateHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
      ),
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    String title,
    String subtitle,
    String amount,
    bool isCredit,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isCredit ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isCredit ? LucideIcons.arrowDownLeft : LucideIcons.arrowUpRight,
            color: isCredit ? Colors.green : Colors.red,
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isCredit ? Colors.green : Colors.red,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
