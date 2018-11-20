# RdTools

pod 'RdTools'

在要使用的文件引入`import <RdToolsHeader.h>`即可

`UIView+RdMasonry`，该分类对Masonry进行了链式函数的封装，简化了`Masonry`的使用。

分类`UIView+RdTools`、`UILabel+RdTools`、`UIButton+RdTools`、`UIImage+RdTools`等等。
都是对这些控件常用的方法进行了简单的封装，或者使用链式函数封装。

`RdScrollView`类是为了使`Masonry`自动布局而创建的类。视图要在`rd_contentView`的上面创建，并且设定好约束关系。
