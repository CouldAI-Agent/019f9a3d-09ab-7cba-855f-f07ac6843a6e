import 'package:flutter/material.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAssetItem(context, 'Bitcoin', 'BTC', '0.45 BTC', '\$18,967.50', '+2.4%'),
          _buildAssetItem(context, 'Ethereum', 'ETH', '4.2 ETH', '\$9,408.00', '-1.2%'),
          _buildAssetItem(context, 'Solana', 'SOL', '150 SOL', '\$14,775.00', '+5.6%'),
          _buildAssetItem(context, 'Cardano', 'ADA', '5000 ADA', '\$2,500.00', '+1.1%'),
          _buildAssetItem(context, 'Polkadot', 'DOT', '200 DOT', '\$1,400.00', '-0.5%'),
        ],
      ),
    );
  }

  Widget _buildAssetItem(
    BuildContext context,
    String name,
    String symbol,
    String amount,
    String value,
    String change,
  ) {
    final isPositive = change.startsWith('+');
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            symbol[0],
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(amount),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(
              change,
              style: TextStyle(
                color: isPositive ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
