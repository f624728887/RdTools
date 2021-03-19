# RdTools

技术上限较低，更新频繁请谅解。

pod 'RdTools'

引入`import <RdToolsHeader.h>`即可使用

`UIView+RdMasonry`，该分类对Masonry进行了链式函数的封装，简化了`Masonry`的使用。

分类`UIView+RdTools`、`UILabel+RdTools`、`UIButton+RdTools`、`UIImage+RdTools`等等。
都是对这些控件常用的方法进行了简单的封装，并使用链式函数封装，方便快速布局。

`RdScrollView`类是为了使用`Masonry`自动布局而创建的类。视图要在`.contentView`的上面创建，并且设定好约束关系。
