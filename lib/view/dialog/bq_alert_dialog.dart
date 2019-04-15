import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_action/util/divider_line.dart';

typedef OnLeftButtonClickCallBack = void Function();
typedef OnRightButtonClickCallBack = void Function();

class BqAlertDialog extends StatelessWidget {
  final OnLeftButtonClickCallBack onLeftButtonClickCallBack;
  final OnRightButtonClickCallBack onRightButtonClickCallBack;

  /// Creates an alert dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  ///
  /// The [contentPadding] must not be null. The [titlePadding] defaults to
  /// null, which implies a default that depends on the values of the other
  /// properties. See the documentation of [titlePadding] for details.
  const BqAlertDialog({
    Key key,
    this.title,
    this.titleTextStyle = const TextStyle(
        color: const Color(0xff333333),
        fontSize: 17.0,
        fontWeight: FontWeight.bold),
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle =
        const TextStyle(color: const Color(0xFF444444), fontSize: 16.0),
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.shape,
    this.leftButtonText = '取消',
    this.rightButtontText = '确认',
    this.showLeftButton = true,
    this.showRightButton = true,
    this.onRightButtonClickCallBack,
    this.onLeftButtonClickCallBack,
  })  : assert(contentPadding != null),
        super(key: key);
  final bool showRightButton;
  final bool showLeftButton;
  final String leftButtonText;
  final String rightButtontText;

  /// The (optional) title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Style for the text in the [title] of this [BqAlertDialog].
  ///
  /// If null, [DialogTheme.titleTextStyle] is used, if that's null, defaults to
  /// [ThemeData.textTheme.title].
  final TextStyle titleTextStyle;

  /// The (optional) content of the dialog is displayed in the center of the
  /// dialog in a lighter font.
  ///
  /// Typically this is a [SingleChildScrollView] that contains the dialog's
  /// message. As noted in the [BqAlertDialog] documentation, it's important
  /// to use a [SingleChildScrollView] if there's any risk that the content
  /// will not fit.
  final Widget content;

  /// Padding around the content.
  ///
  /// If there is no content, no padding will be provided. Otherwise, padding of
  /// 20 pixels is provided above the content to separate the content from the
  /// title, and padding of 24 pixels is provided on the left, right, and bottom
  /// to separate the content from the other edges of the dialog.
  final EdgeInsetsGeometry contentPadding;

  /// Style for the text in the [content] of this [BqAlertDialog].
  ///
  /// If null, [DialogTheme.contentTextStyle] is used, if that's null, defaults
  /// to [ThemeData.textTheme.subhead].
  final TextStyle contentTextStyle;

  /// {@macro flutter.material.dialog.backgroundColor}
  final Color backgroundColor;

  /// {@macro flutter.material.dialog.elevation}
  /// {@macro flutter.material.material.elevation}
  final double elevation;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the dialog is opened and closed.
  ///
  /// If this label is not provided, a semantic label will be infered from the
  /// [title] if it is not null.  If there is no title, the label will be taken
  /// from [MaterialLocalizations.alertDialogLabel].
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.isRouteName], for a description of how this
  ///    value is used.
  final String semanticLabel;

  /// {@macro flutter.material.dialog.shape}
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final DialogTheme dialogTheme = DialogTheme.of(context);
    final List<Widget> children = <Widget>[];
    String label = semanticLabel;

    if (title != null) {
      children.add(Padding(
        padding: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
        child: new Center(
          child: DefaultTextStyle(
            style: titleTextStyle ??
                dialogTheme.titleTextStyle ??
                theme.textTheme.title,
            child: Semantics(
              child: title,
              namesRoute: true,
              container: true,
            ),
          ),
        ),
      ));
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          label = semanticLabel;
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          label = semanticLabel ??
              MaterialLocalizations.of(context)?.alertDialogLabel;
      }
    }

    if (content != null) {
      children.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: new Center(
            child: DefaultTextStyle(
              style: contentTextStyle ??
                  dialogTheme.contentTextStyle ??
                  theme.textTheme.subhead,
              child: content,
            ),
          )));
    }

    if (showRightButton && showLeftButton) {
      children.add(Column(
        children: <Widget>[
          DividerLineWidget(),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              _getLeftButton(),
              Expanded(
                flex: 0,
                child: DividerLineWidget(width: 0.4, height: 48.0),
              ),
              _getRightButton(),
            ],
          ),
        ],
      ));
    }
    if (!showRightButton && showLeftButton) {
      children.add(Column(
        children: <Widget>[
          DividerLineWidget(),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              _getLeftButton(),
            ],
          ),
        ],
      ));
    }

    if (showRightButton && !showLeftButton) {
      children.add(Column(
        children: <Widget>[
          DividerLineWidget(),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              _getRightButton(),
            ],
          ),
        ],
      ));
    }
    Widget dialogChild = IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );

    if (label != null)
      dialogChild =
          Semantics(namesRoute: true, label: label, child: dialogChild);

    return Dialog(
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      child: dialogChild,
    );
  }

  Expanded _getLeftButton() {
    return Expanded(
        flex: 1,
        child: new GestureDetector(
          onTap: () {
            if (onLeftButtonClickCallBack != null) onLeftButtonClickCallBack();
          },
          child: Container(
            height: 48,
            child: new Center(
              child: Text(
                leftButtonText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF666666), fontSize: 15.0),
              ),
            ),
          ),
        ));
  }

  Expanded _getRightButton() {
    return Expanded(
        flex: 1,
        child: new GestureDetector(
          onTap: () {
            if (onRightButtonClickCallBack != null)
              onRightButtonClickCallBack();
          },
          child: new Container(
            height: 48,
            child: Center(
              child: Text(
                rightButtontText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFFF4436), fontSize: 15.0),
              ),
            ),
          ),
        ));
  }
}
