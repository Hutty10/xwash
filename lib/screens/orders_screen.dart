import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/category_bottomsheet.dart';
import '../widgets/support_dialog.dart';

class LaundryOrder extends ConsumerStatefulWidget {
  const LaundryOrder({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LaundryOrderState();
}

class _LaundryOrderState extends ConsumerState<LaundryOrder> {
  int _topQty = 1;
  double get _topPrice => _topQty * 50;
  int _downQty = 1;
  double get _downPrice => _downQty * 50;
  int _topHQty = 1;
  double get _topHPrice => _topHQty * 50;
  int _downHQty = 1;
  double get _downHPrice => _downHQty * 50;
  int _nativeQty = 1;
  double get _nativePrice => _nativeQty * 50;

  double get _total =>
      _topPrice + _downPrice + _topHPrice + _downHPrice + _nativePrice;

  int _selectedOrder = 0;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(.1),
        foregroundColor: theme.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => const CategoryBottomSheet(),
            ),
            icon: Icon(
              Icons.monetization_on_outlined,
              size: 32,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (_) => const SupportDialog(),
            ),
            padding: const EdgeInsets.only(right: 30),
            icon: Icon(
              Icons.chat_outlined,
              size: 32,
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // primary: false,
          // physics: const NeverScrollableScrollPhysics(),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Laundry Order',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (_, index) {
                  final text = _list[index];
                  return ListViewItem(
                    text: text,
                    onTap: () => setState(() {
                      _selectedOrder = index;
                    }),
                    selected: _selectedOrder == index,
                  );
                },
              ),
            ),
            Expanded(
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                ),
                // itemCount: 5,
                children: [
                  GridItem(
                    onAddTap: () => setState(() {
                      if (_topQty >= 0) {
                        _topQty++;
                      }
                    }),
                    onMinusTap: () => setState(() {
                      if (_topQty > 0) {
                        _topQty--;
                      }
                    }),
                    title: 'Tops (soft)',
                    price: _topPrice,
                    qty: _topQty,
                    img: '',
                  ),
                  GridItem(
                    onAddTap: () => setState(() {
                      if (_downQty >= 0) {
                        _downQty++;
                      }
                    }),
                    onMinusTap: () => setState(() {
                      if (_downQty > 0) {
                        _downQty--;
                      }
                    }),
                    title: 'Down (soft)',
                    price: _downPrice,
                    qty: _downQty,
                    img: '',
                  ),
                  GridItem(
                    onAddTap: () => setState(() {
                      if (_topHQty >= 0) {
                        _topHQty++;
                      }
                    }),
                    onMinusTap: () => setState(() {
                      if (_topHQty > 0) {
                        _topHQty--;
                      }
                    }),
                    title: 'Tops ',
                    price: _topHPrice,
                    qty: _topHQty,
                    img: '',
                  ),
                  GridItem(
                    onAddTap: () => setState(() {
                      if (_downHQty >= 0) {
                        _downHQty++;
                      }
                    }),
                    onMinusTap: () => setState(() {
                      if (_downHQty > 0) {
                        _downHQty--;
                      }
                    }),
                    title: 'Downs',
                    price: _downHPrice,
                    qty: _downHQty,
                    img: '',
                  ),
                  GridItem(
                    onAddTap: () => setState(() {
                      if (_nativeQty >= 0) {
                        _nativeQty++;
                      }
                    }),
                    onMinusTap: () => setState(() {
                      if (_nativeQty > 0) {
                        _nativeQty--;
                      }
                    }),
                    title: 'Native',
                    price: _nativePrice,
                    qty: _nativeQty,
                    img: '',
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Account ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Text(
                            'pay $_total to\n\nBank: UBA\nAccount No: 2120446632\nAccount Name: Victor Anthony',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Text(
                          'Send proof of payment to +2348164080455 on WhatsApp',
                        )
                      ],
                    ),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 45),
                backgroundColor: theme.primaryColor,
              ),
              child: Text('Pay $_total'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.onTap,
    required this.text,
    required this.selected,
  });

  final String text;
  final bool selected;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: selected ? theme.primaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// class LaundryOrder extends ConsumerStatefulWidget {
//   const LaundryOrder({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LaundryOrderState();
// }

// class _LaundryOrderState extends ConsumerState<LaundryOrder> {
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white.withOpacity(.1),
//         foregroundColor: theme.primaryColor,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () => context.pop(),
//           icon: const Icon(Icons.arrow_back_ios_new),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () => showModalBottomSheet(
//               context: context,
//               builder: (context) => const CategoryBottomSheet(),
//             ),
//             icon: Icon(
//               Icons.monetization_on_outlined,
//               size: 32,
//               color: theme.primaryColor,
//             ),
//           ),
//           const SizedBox(width: 10),
//           IconButton(
//             onPressed: () => showDialog(
//               context: context,
//               builder: (_) => const SupportDialog(),
//             ),
//             padding: const EdgeInsets.only(right: 30),
//             icon: Icon(
//               Icons.chat_outlined,
//               size: 32,
//               color: theme.primaryColor,
//             ),
//           ),
//         ],
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         children: [
//           Text(
//             'Laundry Order',
//             style: TextStyle(
//               color: theme.primaryColor,
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 20),
//           const LinearProgressIndicator(value: .9),
//           const SizedBox(height: 20),
//           OrderListTile(
//             onTap: () {},
//             leadingIcon: 'assets/images/home.png',
//             title: 'Add Address',
//           ),
//           OrderListTile(
//             onTap: () => showModalBottomSheet(
//               context: context,
//               builder: (_) => const OrderTypeBottomSheet(),
//             ),
//             leadingIcon: 'assets/images/home.png',
//             title: 'Select order type',
//           ),
//           OrderListTile(
//             onTap: () {},
//             leadingIcon: 'assets/images/home.png',
//             title: 'Schedule your pick up',
//           ),
//           OrderListTile(
//             onTap: () {},
//             leadingIcon: 'assets/images/home.png',
//             title: 'Schedule your drop off',
//           ),
//         ],
//       ),
//     );
//   }
// }

class OrderTypeBottomSheet extends StatelessWidget {
  const OrderTypeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Two way to schedule an order',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 20),
          const ScheduleContainer(
            selected: true,
          ),
          const SizedBox(height: 20),
          const ScheduleContainer(
            selected: false,
          ),
        ],
      ),
    );
  }
}

class ScheduleContainer extends StatelessWidget {
  const ScheduleContainer({
    super.key,
    required this.selected,
  });
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width - 30,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(.08),
        borderRadius: BorderRadius.circular(8),
        border: selected
            ? const Border(
                top: BorderSide(),
                bottom: BorderSide(),
                right: BorderSide(),
                left: BorderSide(),
              )
            : null,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Flex',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Service fee: free',
                    style: TextStyle(color: theme.primaryColor),
                  ),
                  Text(
                    'Minimum order: NGN 43',
                    style: TextStyle(color: theme.primaryColor),
                  ),
                ],
              )
            ],
          ),
          Divider(color: theme.primaryColor.withOpacity(.3)),
          BulletText(
            text: 'Flexible timing',
            selected: selected,
          ),
          const SizedBox(height: 10),
          BulletText(
            text: 'Pick up & drop off at door service',
            selected: selected,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Most Popular',
                    style: TextStyle(color: Colors.amber),
                  )
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(),
                ),
                child: Icon(
                  Icons.check_circle_outline,
                  color: selected
                      ? theme.primaryColor
                      : theme.primaryColor.withOpacity(.3),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  const BulletText({
    super.key,
    required this.text,
    required this.selected,
  });
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: selected
                ? theme.primaryColor
                : theme.primaryColor.withOpacity(.3),
            shape: BoxShape.circle,
          ),
          child: const SizedBox(),
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(
            color: selected
                ? theme.primaryColor
                : theme.primaryColor.withOpacity(.3),
          ),
        ),
      ],
    );
  }
}

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.leadingIcon,
  });
  final GestureTapCallback onTap;
  final String leadingIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        leadingIcon,
        width: 30,
        height: 30,
        color: const Color(0xff6F64E7),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      minLeadingWidth: 10,
      title: Text(
        title,
        style: TextStyle(color: theme.primaryColor),
      ),
      trailing: IconButton(
        onPressed: () {},
        color: theme.primaryColor,
        icon: const Icon(Icons.add),
      ),
    );
  }
}

const List<String> _list = [
  'Wash',
  'Press',
  'Dryclean',
  'Special Dryclean',
  'white'
];
const List<Map<String, String>> data = [
  {
    'title': 'Top (soft)',
    'img': '',
  }
];

class GridItem extends ConsumerWidget {
  const GridItem({
    super.key,
    required this.onAddTap,
    required this.onMinusTap,
    required this.price,
    required this.qty,
    required this.img,
    required this.title,
  });
  final GestureTapCallback onAddTap;
  final GestureTapCallback onMinusTap;
  final double price;
  final int qty;
  final String img;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Container(
          color: theme.primaryColor,
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Text(title),
        ),
        Image.asset(
          'assets/images/cloths.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          height: 35,
          padding: const EdgeInsets.only(bottom: 2),
          color: theme.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₦ $price',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onAddTap,
                    child: const Icon(
                      Icons.add,
                      size: 22,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    alignment: AlignmentDirectional.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      '$qty',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: onMinusTap,
                    child: const Icon(
                      Icons.remove,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
