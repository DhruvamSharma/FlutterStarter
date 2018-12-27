import 'package:flutter/material.dart';
import 'package:shrine/product.dart';


const double _kShrineFlingVelocity = 2;


class Backdrop extends StatefulWidget {
  final Category category;
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    @required this.frontLayer,
    @required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
    @required this.category,
  })  : assert(frontLayer != null),
        assert(backLayer != null),
        assert(frontTitle != null),
        assert(backTitle != null);

  @override
  createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
  with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
        value: 1,
        vsync: this
    );
  }


  @override
  void dispose() {
    _animationController.dispose();
  }

  // TODO: Add override for didUpdateWidget() (104)
  @override
  void didUpdateWidget(Backdrop old) {
    super.didUpdateWidget(old);

    if (widget.category != old.category) {
      toggleBackdropVisibility();
    } else if (!_frontLayerVisible) {
      _animationController.fling(velocity: _kShrineFlingVelocity);
    }
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {

    const double layerTitleHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_animationController.view);


    return Stack(
      key: _backdropKey,
      children: <Widget>[
        ExcludeSemantics(
          child: widget.backLayer,
          excluding: _frontLayerVisible,
        ),
        PositionedTransition(
          rect: layerAnimation,
          child: _FrontLayer(child: widget.frontLayer,
        ),

        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar(),
      body: LayoutBuilder(builder: _buildStack),
    );
  }


  bool get _frontLayerVisible {
    final status = _animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void toggleBackdropVisibility() {
    _animationController.fling(
      velocity: _frontLayerVisible? -_kShrineFlingVelocity: _kShrineFlingVelocity
    );
  }

  Widget appBar() {
    return AppBar(
      brightness: Brightness.light,
      title: Text(
        "SHRINE",
        semanticsLabel: "Application Name",
      ),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          semanticLabel: "Menu icon",
        ),
        onPressed: () {
          toggleBackdropVisibility();
        },
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: "Search icon",
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              Icons.shopping_cart,
              semanticLabel: "Shopping Cart icon",
            ),
            onPressed: () {}),
      ],
    );
  }
}


class _GalleryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _GalleryAppBar();

  @override
  Widget build(BuildContext context) {
    ;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}


class _FrontLayer extends StatelessWidget {

  final Widget child;

  _FrontLayer({
    Key key,
    @required this.child,
}): assert(child!=null),
    super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      elevation: 16,
        child: child,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(36)),
        ),
    );
  }
}

