USE [ProjectDemo]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 09/25/2016 19:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](16) NOT NULL,
	[Password] [char](32) NOT NULL,
	[RealName] [nvarchar](10) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[UserType] [tinyint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户类型 1超级管理员 2网站管理员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'UserType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0禁用 1启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserInfo'
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON
INSERT [dbo].[UserInfo] ([UserId], [Username], [Password], [RealName], [Phone], [UserType], [Status], [CreateDate]) VALUES (1, N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'超级管理员', N'01234567890', 1, 1, CAST(0x0000A63E01336B9C AS DateTime))
INSERT [dbo].[UserInfo] ([UserId], [Username], [Password], [RealName], [Phone], [UserType], [Status], [CreateDate]) VALUES (4, N'test', N'E10ADC3949BA59ABBE56E057F20F883E', N'测试', N'123456', 1, 0, CAST(0x0000A63E0133EA2C AS DateTime))
INSERT [dbo].[UserInfo] ([UserId], [Username], [Password], [RealName], [Phone], [UserType], [Status], [CreateDate]) VALUES (6, N'tttt', N'E10ADC3949BA59ABBE56E057F20F883E', N'网管', N'123456', 2, 0, CAST(0x0000A63E00C8E740 AS DateTime))
INSERT [dbo].[UserInfo] ([UserId], [Username], [Password], [RealName], [Phone], [UserType], [Status], [CreateDate]) VALUES (12, N'abcde', N'E10ADC3949BA59ABBE56E057F20F883E', N'AA', N'0123', 2, 1, CAST(0x0000A63E01330986 AS DateTime))
INSERT [dbo].[UserInfo] ([UserId], [Username], [Password], [RealName], [Phone], [UserType], [Status], [CreateDate]) VALUES (15, N'yh', N'E10ADC3949BA59ABBE56E057F20F883E', N'以恒', N'0591', 1, 1, CAST(0x0000A64A00B18526 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 09/25/2016 19:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Brand] [nvarchar](20) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](2000) NOT NULL,
	[ImgUrl] [varchar](100) NOT NULL,
	[ThumbUrl] [varchar](100) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Click] [int] NOT NULL,
	[SortIndex] [int] NOT NULL,
	[CreateUserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateUserId] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品品牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Brand'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品缩略图路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'ThumbUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0不显示 1显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点击次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'Click'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'UpdateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'UpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product'
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Brand], [Type], [Description], [Content], [ImgUrl], [ThumbUrl], [Status], [Click], [SortIndex], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (1, 14, N'艾诺 高清大屏MP4触摸+按键', N'艾诺', N'V8000HDZ', N'艾诺V8000HDZ 8G 7寸 高清大屏MP4触摸+按键 艾诺MP5 MP4...', N'', N'/Upload/bae1c33a-58d4-40b6-8243-1acb4565e9d4.jpg', N'/Upload/Thumbnail/bae1c33a-58d4-40b6-8243-1acb4565e9d4.jpg', 1, 1, 1, 1, CAST(0x0000A6450106A454 AS DateTime), 1, CAST(0x0000A65100AC62B5 AS DateTime))
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Brand], [Type], [Description], [Content], [ImgUrl], [ThumbUrl], [Status], [Click], [SortIndex], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (2, 15, N'7寸雷达一体机 中恒G7PRO豪华版2680', N'中恒', N'G7PRO', N'中恒 G7PRO豪华版是国内首款7英寸雷达一体机产品，融合及时准确的雷达预警及平行于GPS产品的行车导航能力，与7英寸硕大屏幕带来的高清显示于一体。并且融入了双向行车记录仪，在性能表现上相当不错。近日...', N'', N'/Upload/b61e0aba-c2e8-42f5-bdf0-0de832d85bcd.jpg', N'/Upload/Thumbnail/b61e0aba-c2e8-42f5-bdf0-0de832d85bcd.jpg', 1, 2, 1, 1, CAST(0x0000A645010782FC AS DateTime), 1, CAST(0x0000A65100AC54B2 AS DateTime))
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Brand], [Type], [Description], [Content], [ImgUrl], [ThumbUrl], [Status], [Click], [SortIndex], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (3, 13, N'索尼mp3', N'索尼', N'X1', N'好家伙', N'', N'/Upload/9e997baa-7056-40f3-84c3-05301dc614f2.jpg', N'/Upload/Thumbnail/9e997baa-7056-40f3-84c3-05301dc614f2.jpg', 1, 4, 1, 1, CAST(0x0000A646017165A0 AS DateTime), 1, CAST(0x0000A65100AC4A8A AS DateTime))
INSERT [dbo].[Product] ([ProductId], [CategoryId], [Name], [Brand], [Type], [Description], [Content], [ImgUrl], [ThumbUrl], [Status], [Click], [SortIndex], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (4, 15, N'以恒GPS', N'以恒', N'YH100', N'中恒 G7PRO豪华版是国内首款7英寸雷达一体机产品，融合及时准确的雷达预警及平行于GPS产品的行车导航能力，与7英寸硕大屏幕带来的高清显示于一体。并且融入了双向行车记录仪，在性能表现上相当不错。', N'<p style="text-indent: 2em;"><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;">中恒&nbsp;</span><a href="http://detail.zol.com.cn/gps/index308116.shtml" style="color: rgb(51, 51, 51); text-decoration: none; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">G7PRO豪华版</a><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;">是国内首款7英寸雷达</span><a href="http://aio.zol.com.cn/" style="color: rgb(51, 51, 51); text-decoration: none; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">一体机</a><a href="http://detail.zol.com.cn/" style="color: rgb(51, 51, 51); text-decoration: none; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">产品</a><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;">，融合及时准确的雷达预警及平行于</span><a href="http://gps.zol.com.cn/" style="color: rgb(51, 51, 51); text-decoration: none; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">GPS</a><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;">产品的行车导航能力，与7英寸硕大屏幕带来的高清显示于一体。并且融入了双向行车记录仪，在性能表现上相当不错。近日，小编在石家庄腾跃数码了解到，该款GPS的最新售价为2680元。喜欢的朋友不妨多了解一下。</span></p>', N'/Upload/3f23ffb0-f570-45a1-a9d1-629d6ba495e4.jpg', N'/Upload/Thumbnail/3f23ffb0-f570-45a1-a9d1-629d6ba495e4.jpg', 1, 2, 2, 1, CAST(0x0000A6460171BA00 AS DateTime), 1, CAST(0x0000A65401782301 AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  StoredProcedure [dbo].[proc_Pager]    Script Date: 09/25/2016 19:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_Pager] 
	/*分页存储过程*/
	@PageIndex int=1,--第几页
	@PageSize int=100,--每页记录数
	@Table nvarchar(20),--表
	@Where nvarchar(500)='1=1',--条件
	@Fields nvarchar(500)='*',--字段列表
	@OrderBy nvarchar(500),--排序	
	@Total int output--总记录数
as
	begin
	
		declare @sql nvarchar(1000)
		
		--quotename转义SQL系统关键字  加上[]
		set @sql='select @c=count(*) from '+quotename(@table)+' where '+@where
		--查询总记录数
		exec sp_executesql
			@stmt=@sql,
			@params=N'@c int output',
			@c=@total output
		
		--查询分页数据
		set @sql='select * from (select ROW_NUMBER() over(order by '+@OrderBy+') RowNumber,'+@Fields+' from '+quotename(@Table)+' where '+@Where+') t where t.RowNumber between '+convert(nvarchar(50),(@PageIndex-1)*@PageSize+1)+' and '+convert(nvarchar(50),@PageIndex*@PageSize);
		exec sp_executesql
			@stmt=@sql
			
	end
GO
/****** Object:  Table [dbo].[News]    Script Date: 09/25/2016 19:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](2000) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Click] [int] NOT NULL,
	[CreateUserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateUserId] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_新闻] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'NewsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0不显示 1显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点击次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'Click'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'CreateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'UpdateUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News', @level2type=N'COLUMN',@level2name=N'UpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'News'
GO
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([NewsId], [CategoryId], [Title], [Content], [Status], [Click], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (8, 9, N'为民服务新举措 中移动推Easy WLAN手机客户端', N'<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;昨今儿一早，小张就收到好友的一条短信：“兄弟，我在星巴克附近上网，有个好东东给你介绍，试了好用记得请我吃饭。赶紧下载移动的EasyWLAN客户端。你有全球通套餐，可以免费使用到年底。”后面还有一条，“免费客户端下载：手机点击http://easy.g3quay.net/easywlan/ 或上网搜索‘EasyWLAN’。”这是什么业务呢?怀着好奇的心里，小张上网查询了相关内容。
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', 1, 302, 9, CAST(0x0000A642016053B4 AS DateTime), 1, CAST(0x0000A64600C3D972 AS DateTime))
INSERT [dbo].[News] ([NewsId], [CategoryId], [Title], [Content], [Status], [Click], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (9, 10, N'Google推出知识图谱 搜索模式迎来大变革', N'<p style="text-indent: 2em;"><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 24px;">微软必应宣布了大改版以后，Google也不甘寂寞。昨天Google在其官方博客上公布了最新搜索功能知识图谱(Knowledge Graph)。Google在搜索页面右侧增加了大篇幅的更明确的搜索结果，改变了以往以文字为主的搜索结果条目呈现方式，可能是Google搜索上线以来最重大的一次变革。xxxx</span></p>', 1, 202, 1, CAST(0x0000A6420160D5C8 AS DateTime), 1, CAST(0x0000A6500136B22D AS DateTime))
INSERT [dbo].[News] ([NewsId], [CategoryId], [Title], [Content], [Status], [Click], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (10, 9, N'雅虎或出售亚洲资产推动阿里巴巴集团IPO', N'<p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; text-indent: 2em;">新浪科技讯 北京时间5月18日凌晨消息，观察人士称，对冲基金Third Point CEO丹尼尔·勒布(Daniel Loeb)在成为雅虎董事后将推进更加谨慎的策略，其中一方面就是专注于推进阿里巴巴(微博)集团的上市。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　由于Third Point在雅虎内部斗争中获胜，越来越多的推测称，雅虎新董事会将加速出售亚洲资产，特别是最有价值的阿里巴巴集团股份。但是其他观察人士称，勒布将会推行更加谨慎的策略，其中之一就是专注于阿里巴巴集团的上市。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　雅虎拥有阿里巴巴集团42%的股份，在发起代理权之争运动期间，Third Point就将阿里巴巴集团视为“全球最有价值互联网公司之一”，潜在估值在大约350亿美元。</p><p><br/></p>', 1, 2, 1, CAST(0x0000A6500136D772 AS DateTime), 1, CAST(0x0000A6500136D772 AS DateTime))
INSERT [dbo].[News] ([NewsId], [CategoryId], [Title], [Content], [Status], [Click], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (11, 9, N'松下财报巨亏 电视业务成拖累', N'<p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal; text-indent: 2em;">又一家日本企业拿出了巨亏财报，电视业务拖累是原因之一。松下已经开始转型，它期望能在能源领域找到新的优势。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　这次是松下</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　文|CBN记者 邹曈</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　日本消费电子业正在集体与旧日荣光道别。先是索尼、夏普迎来了历史性巨亏，这一次又轮到了松下。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　5月11日，松下宣布2011财年净亏损7721亿日元(约合610亿元人民币)，这是日本制造业史上第二大规模的亏损。亏损的一个重要原因是电视业务裁员费用以及收购三洋电机而计入的一次性支出，这些费用合计高达7671亿日元(约合606亿元人民币)。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　另一方面，松下主营的电视、半导体、锂离子电池业务的低迷也拖累了公司。其中包含电视在内的AVC网络业务营业亏损达到678亿日元(约合54亿元人民币)，是所有业务中亏损最多的。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　尴尬的2011财年是松下三年中期经营计划(Green Transformation 2012)的第二年。根据此计划，松下将转型为绿色能源企业，从以提供产品为中心变为以提供解决方案为中心，并加快全球化进展。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;', 1, 0, 1, CAST(0x0000A65401848AC0 AS DateTime), 1, CAST(0x0000A65401848AC0 AS DateTime))
INSERT [dbo].[News] ([NewsId], [CategoryId], [Title], [Content], [Status], [Click], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (12, 10, N'日本厂商打造0.25毫米超薄防水手机套', N'<p style="text-indent: 2em;"><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;">目前，大部分具有防水功能的手机壳都必须以牺牲手感为代价，被制作得十分厚重。不过最近日本推出的一款超薄防水手机套或许会改变我们的看法。这一款超薄防水套只有0.25mm厚，主要材料为聚氨酯，可以紧紧的包裹着iPhone。</span></p><p style="text-indent: 2em;"><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;"><br/></span></p><p style="text-indent: 2em;"><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;">制造者表示，这个保护套符合日本IPX8防水标准，即是说它可以最多保证你的iPhone放在10米深的水中而不受到伤害。保护套的屏幕部分采用的是丙烯酸，在平时不会影响操作使用。</span><br/><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;"><br/></span></p><p style="text-indent: 2em;"><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px;">另外，因为这个保护套只有0.25mm厚，所以你可以在套上它的同时再另外套上自己喜欢的保护套而丝毫不受影响。目前这款保护套有兼容 iPhone以及三星Galaxy&nbsp;S2的版本出售，售价37美元。另外制造商还准备生产ipad版的保护套，售价50美元。</span></p><p><br/></p>', 1, 0, 1, CAST(0x0000A6540184C344 AS DateTime), 1, CAST(0x0000A6540184C344 AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  Table [dbo].[FriendlyLink]    Script Date: 09/25/2016 19:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FriendlyLink](
	[LinkId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Url] [varchar](200) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[SortIndex] [int] NOT NULL,
 CONSTRAINT [PK_FriendlyLink] PRIMARY KEY CLUSTERED 
(
	[LinkId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'友情链接编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FriendlyLink', @level2type=N'COLUMN',@level2name=N'LinkId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接显示名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FriendlyLink', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FriendlyLink', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0不显示 1显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FriendlyLink', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FriendlyLink', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'友情链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FriendlyLink'
GO
SET IDENTITY_INSERT [dbo].[FriendlyLink] ON
INSERT [dbo].[FriendlyLink] ([LinkId], [Name], [Url], [Status], [SortIndex]) VALUES (1, N'腾讯', N'http://www.qq.com', 1, 1)
INSERT [dbo].[FriendlyLink] ([LinkId], [Name], [Url], [Status], [SortIndex]) VALUES (2, N'百度', N'http://www.baidu.com', 1, 2)
INSERT [dbo].[FriendlyLink] ([LinkId], [Name], [Url], [Status], [SortIndex]) VALUES (4, N'淘宝', N'http://www.taobao.com', 1, 3)
INSERT [dbo].[FriendlyLink] ([LinkId], [Name], [Url], [Status], [SortIndex]) VALUES (5, N'新浪', N'http://www.sina.com.cn', 1, 4)
INSERT [dbo].[FriendlyLink] ([LinkId], [Name], [Url], [Status], [SortIndex]) VALUES (6, N'网易', N'http://www.163.com', 1, 5)
SET IDENTITY_INSERT [dbo].[FriendlyLink] OFF
/****** Object:  Table [dbo].[Feedback]    Script Date: 09/25/2016 19:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[MsgId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[QQ] [bigint] NOT NULL,
	[Msg] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[ReplyMsg] [nvarchar](100) NOT NULL,
	[ReplyUserId] [int] NOT NULL,
	[ReplyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MsgId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'MsgId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言人Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言人QQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'QQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'Msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0不显示 1显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'ReplyMsg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'ReplyUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback', @level2type=N'COLUMN',@level2name=N'ReplyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'留言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Feedback'
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON
INSERT [dbo].[Feedback] ([MsgId], [Name], [Email], [QQ], [Msg], [CreateDate], [Status], [ReplyMsg], [ReplyUserId], [ReplyDate]) VALUES (1, N'张三', N'123456@qq.com', 123456, N'有什么产品', CAST(0x0000A643015A4D84 AS DateTime), 1, N'有很多产品啊', 1, CAST(0x0000A643016A2BB0 AS DateTime))
INSERT [dbo].[Feedback] ([MsgId], [Name], [Email], [QQ], [Msg], [CreateDate], [Status], [ReplyMsg], [ReplyUserId], [ReplyDate]) VALUES (2, N'李四', N'1234567@qq.com', 1234567, N'哇哇', CAST(0x0000A643015AA0B8 AS DateTime), 1, N'你好啊，朋友！！！！！！！！！！！', 1, CAST(0x0000A654017A7CF3 AS DateTime))
INSERT [dbo].[Feedback] ([MsgId], [Name], [Email], [QQ], [Msg], [CreateDate], [Status], [ReplyMsg], [ReplyUserId], [ReplyDate]) VALUES (3, N'王五', N'123@163.com', 123456, N'我想买GPS导航仪', CAST(0x0000A654017AAD91 AS DateTime), 1, N'', 0, CAST(0x0000A654017AAD91 AS DateTime))
INSERT [dbo].[Feedback] ([MsgId], [Name], [Email], [QQ], [Msg], [CreateDate], [Status], [ReplyMsg], [ReplyUserId], [ReplyDate]) VALUES (4, N'Steve', N'Steve@163.com', 10000, N'日本消费电子业正在集体与旧日荣光道别。先是索尼、夏普迎来了历史性巨亏，这一次又轮到了松下', CAST(0x0000A65401836318 AS DateTime), 1, N'松下已经开始转型，它期望能在能源领域找到新的优势', 1, CAST(0x0000A654018371E3 AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
/****** Object:  Table [dbo].[Config]    Script Date: 09/25/2016 19:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Config](
	[ConfigId] [int] IDENTITY(1,1) NOT NULL,
	[Copyright] [nvarchar](100) NOT NULL,
	[AboutImgUrl] [varchar](100) NOT NULL,
	[AboutIntro] [nvarchar](200) NOT NULL,
	[AboutUrl] [varchar](50) NOT NULL,
	[NewsUrl] [varchar](50) NOT NULL,
	[ContactImgUrl] [varchar](100) NOT NULL,
	[ContactUrl] [varchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Postcode] [int] NOT NULL,
	[Telephone] [varchar](15) NOT NULL,
	[Website] [varchar](30) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[ProductUrl] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ConfigId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站配置编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ConfigId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版权信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Copyright'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关于公司图片链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'AboutImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关于公司简介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'AboutIntro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关于公司跳转链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'AboutUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'新闻动态跳转链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'NewsUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系方式图片链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ContactImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系方式跳转链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ContactUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Postcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Website'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司产品跳转链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config', @level2type=N'COLUMN',@level2name=N'ProductUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站配置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Config'
GO
SET IDENTITY_INSERT [dbo].[Config] ON
INSERT [dbo].[Config] ([ConfigId], [Copyright], [AboutImgUrl], [AboutIntro], [AboutUrl], [NewsUrl], [ContactImgUrl], [ContactUrl], [CompanyName], [Address], [Postcode], [Telephone], [Website], [Email], [ProductUrl]) VALUES (1, N'Copyright © 福州以恒教育', N'/Upload/2e653664-5553-4d17-acce-854498a3c51f.jpg', N'以恒理念：为企业解决招人难、用人难、软件项目多人手不够的痛点；为每一位学员获得自己理想的IT工作！
主要业务：
第一、我们提供可靠、高质量的软件外包服务，帮助企业解决软件项目多但又没有开发人员的问题。降低人力资源成本，以达到降低软件开发成本的目的。软件外包的领域包括：cms，crm、企业或政府网站、微信公众平台以及电商平台等项目。
第二、我们也提供人才猎头服务，专门为企业解决招人难的痛点，释', N'/About.aspx', N'/News.aspx', N'/Upload/f0ce5cab-e50c-4a1f-9801-6a4a389e75c1.jpg', N'/Contact.aspx', N'以恒教育', N'福建省福州市大学城', 350000, N'13645086138', N'www.fzyh.net', N'yhedu99@sina.com', N'/Product.aspx')
SET IDENTITY_INSERT [dbo].[Config] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 09/25/2016 19:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[ParentId] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[SortIndex] [int] NOT NULL,
	[Url] [varchar](100) NOT NULL,
	[Content] [nvarchar](2000) NOT NULL,
	[IdPath] [varchar](100) NOT NULL,
	[Depth] [int] NOT NULL,
	[HasChildren] [tinyint] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类类型 1链接 2内容页 3新闻列表 4产品列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级分类编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0不显示 1显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类编号路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'IdPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类深度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'Depth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有子分类 0否 1是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category', @level2type=N'COLUMN',@level2name=N'HasChildren'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Category'
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (1, N'网站首页', 1, 0, 1, 1, N'/Index.aspx', N'', N',1,', 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (2, N'关于公司', 1, 0, 1, 2, N'/About.aspx', N'', N',2,', 1, 1)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (3, N'公司介绍', 2, 2, 1, 1, N'/About/Intro.aspx', N'<p style="text-indent: 2em;"><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 24px;">　　某某有限</span><a href="http://www.baidu.com/" target="_blank" style="color: rgb(51, 51, 51); text-decoration: none; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 24px; white-space: normal;">公司致</a><span style="font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 24px;">力于XX业的发展，专业从事集中润滑系统的研究、开发、制造及销售，凭借公司强大的技术力量和经济实力，不断开发出具有国际先进技术水平的新产品。公司产品广泛适用于数控机械、加工中心、生产线、机床、锻压、纺织、塑料、橡胶、矿山、冶金、建筑、印刷、化工、制药、铸造、食品等各行业的机械设备及大型车辆底盘的集中润滑系统。</span><img src="/ueditor/net/upload/image/20160731/6360560110108626614553910.jpg" alt="6360560110108626614553910.jpg"/><span style="text-indent: 2em; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 24px;"></span></p><p style="text-indent: 2em;"><span style="text-indent: 2em; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; line-height: 24px;">公司总部设在xxx，在全国各大城市设有分支机构，服务网络遍及全国。公司内部实行网络化管理，依托先进的计算机辅助设计系统和计算机管理系统，实现规范化运作，在最短的时间内为用户提供高品质的产品。</span></p>', N',2,3,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (4, N'组织机构', 2, 2, 1, 2, N'/About/Group.aspx', N'<p><img src="/ueditor/net/upload/image/20160731/6360560170818361447017141.jpg" title="2012523151143459857.jpg" alt="2012523151143459857.jpg"/></p>', N',2,4,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (5, N'企业文化', 2, 2, 1, 3, N'/About/Culture.aspx', N'<p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　广义上说，文化是人类社会历史实践过程中所创造的物质财富与精神财富的总和;狭义上说，文化是社会的意识形态以及与之相适应的组织机构与制度。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　而企业文化则是企业在生产经营实践中，逐步形成的，为全体员工所认同并遵守的、带有本组织特点的使命、愿景、宗旨、精神、价值观和经营理念，以及这些理念在生产经营实践、管理制度、员工行为方式与企业对外形象的体现的总和。它与文教、科研、军事等组织的文化性质是不同的。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　企业文化是企业的灵魂，是推动企业发展的不竭动力。它包含着非常丰富的内容，其核心是企业的精神和价值观。这里的价值观不是泛指企业管理中的各种文化现象，而是企业或企业中的员工在从事商品生产与经营中所持有的价值观念。</p>', N',2,5,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (6, N'公司环境', 2, 2, 1, 4, N'/About/Enviro.aspx', N'<p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　中国社科院昨天发布2011年《企业社会责任蓝皮书》，对国有、民营和外资企业百强的社会责任发展水平进行大排行。令人尴尬的是，上述企业的平均得分仅为19.7分，三分之二的企业处于“旁观”地位，超过八成的A股上市企业发布的社会责任报告不及格。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　国企百强的社会责任尚处于起步阶段，平均得分为32.8分，近半国企在旁观;民企百强平均分仅为13.3分，八成在旁观;外企百强平均分仅为12.5分，近八成在旁观。(11月9日 中国网)</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　不得不说，这是一个很让人泄气的统计结果：超过八成的A股上市企业发布的社会责任报告不及格，民企百强八成在旁观，外企百强也是八成在旁观……这样一个让人尴尬的统计数据与其说让这些企业脸红，莫不如说让相关的政府管理部门更脸红。因为当大部分国企、民企、外企都对企业社会责任选择了袖手旁观、漠不关心的时候，只能说明一个问题：我们的社会管理在某些方面出了问题，而且是让企业失去奉献社会责任的大问题。</p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　企业社会责任是什么?它是一个企业在创造利润、对股东承担法律责任的同时，承担对员工、消费者、社区和环境的责任。特别是在当代信息社会和工业社会交融的局面下，更是要求企业超越把利润作为唯一目标的传统理念，专注社会责任建设，更加重视在生产过程中对人的价值的关注，对消费者、对环境、对社会的贡献。这是一个现代企业发展的基本“立身”之道，西方国家的大多数企业在实现发展的同时也都遵循这样的理念——惠及民众，反哺社会。</p><p><br/></p>', N',2,6,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (7, N'公司业务', 2, 2, 1, 5, N'/About/Business.aspx', N'<p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;"><strong>　　民事类：</strong></p><p style="padding: 5px 0px; margin-top: 0px; margin-bottom: 0px; line-height: 24px; font-family: &#39;Microsoft Yahei&#39;, Arial, Helvetica, sans-serif; font-size: 12px; white-space: normal;">　　1、 为公民的个人婚姻、家庭、继承、买卖和租赁房屋、抵押、借贷、侵权、合伙等法律问题提供咨询法律意见，草拟、审查、签订合同和协议;代为处理纠纷。</p><p><br/></p>', N',2,7,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (8, N'新闻动态', 1, 0, 1, 3, N'/News.aspx', N'', N',8,', 1, 1)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (9, N'公司新闻', 3, 8, 1, 1, N'/News/CompanyNews.aspx', N'', N',8,9,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (10, N'行业新闻', 3, 8, 1, 2, N'/News/IndustryNews.aspx', N'', N',8,10,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (11, N'公司产品', 1, 0, 1, 4, N'/Product.aspx', N'', N',11,', 1, 1)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (12, N'数码播放器', 4, 11, 1, 1, N'/Product/DigitalPlayer.aspx', N'', N',11,12,', 2, 1)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (13, N'MP3', 4, 12, 1, 1, N'/Product/DigitalPlayer/MP3.aspx', N'', N',11,12,13,', 3, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (14, N'MP4', 4, 12, 1, 2, N'/Product/DigitalPlayer/MP4.aspx', N'', N',11,12,14,', 3, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (15, N'GPS导航仪', 4, 11, 1, 2, N'/Product/GPS.aspx', N'', N',11,15,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (16, N'联系我们', 1, 0, 1, 7, N'/Contact.aspx', N'', N',16,', 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (17, N'访客留言', 1, 0, 1, 8, N'/Feedback.aspx', N'', N',17,', 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (18, N'人才招聘', 1, 0, 0, 6, N'/Recruit.aspx', N'', N',18,', 1, 1)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (19, N'技术支持', 1, 0, 0, 5, N'/Support.aspx', N'', N',19,', 1, 1)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (20, N'人才培养', 2, 18, 1, 1, N'', N'', N',18,20,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (21, N'福利待遇', 2, 18, 1, 2, N'', N'', N',18,21,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (22, N'招聘职位', 1, 18, 1, 3, N'/Job.aspx', N'', N',18,22,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (23, N'售后服务', 2, 19, 1, 1, N'', N'', N',19,23,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (24, N'下载中心', 3, 19, 1, 2, N'', N'', N',19,24,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (25, N'常见问题', 1, 19, 1, 3, N'/FAQ.aspx', N'', N',19,25,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (26, N'平板电脑', 4, 11, 1, 3, N'/Product/Pad.aspx', N'', N',11,26,', 2, 1)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (27, N'笔记本电脑', 4, 11, 1, 4, N'/Product/NoteBook.aspx', N'', N',11,27,', 2, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [Type], [ParentId], [Status], [SortIndex], [Url], [Content], [IdPath], [Depth], [HasChildren]) VALUES (28, N'iPad', 4, 26, 1, 1, N'/Product/Pad/iPad.aspx', N'', N',11,26,28,', 3, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Banner]    Script Date: 09/25/2016 19:35:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[ImgUrl] [varchar](100) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Url] [varchar](100) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[SortIndex] [int] NOT NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Banner编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner', @level2type=N'COLUMN',@level2name=N'BannerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0不显示 1显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Banner' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Banner'
GO
SET IDENTITY_INSERT [dbo].[Banner] ON
INSERT [dbo].[Banner] ([BannerId], [ImgUrl], [Title], [Url], [Status], [SortIndex]) VALUES (1, N'/Upload/2ff19e3d-13e0-485f-ad24-dbcb842ad6fb.jpg', N'', N'http://www.taobao.com', 1, 3)
INSERT [dbo].[Banner] ([BannerId], [ImgUrl], [Title], [Url], [Status], [SortIndex]) VALUES (2, N'/Upload/a9a2abaf-e2aa-4077-b50d-0986f90dbbf4.jpg', N'', N'http://www.qq.com', 1, 4)
INSERT [dbo].[Banner] ([BannerId], [ImgUrl], [Title], [Url], [Status], [SortIndex]) VALUES (3, N'/Upload/b308b3cd-0132-4926-86c3-97da665a87fe.jpg', N'', N'http://www.sina.com.cn', 1, 2)
INSERT [dbo].[Banner] ([BannerId], [ImgUrl], [Title], [Url], [Status], [SortIndex]) VALUES (5, N'/Upload/0d20b351-8ca6-4adb-a3d5-a36141f1cf1b.jpg', N'', N'http://www.baidu.com', 1, 1)
SET IDENTITY_INSERT [dbo].[Banner] OFF
/****** Object:  Default [DF_UserInfo_Username]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Username]  DEFAULT ('') FOR [Username]
GO
/****** Object:  Default [DF_UserInfo_Password]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Password]  DEFAULT ('') FOR [Password]
GO
/****** Object:  Default [DF_UserInfo_RealName]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_RealName]  DEFAULT ('') FOR [RealName]
GO
/****** Object:  Default [DF_UserInfo_Phone]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Phone]  DEFAULT ('') FOR [Phone]
GO
/****** Object:  Default [DF_UserInfo_UserType]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_UserType]  DEFAULT ((2)) FOR [UserType]
GO
/****** Object:  Default [DF_UserInfo_Status]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_UserInfo_CreateDate]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_Product_CategoryId]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
GO
/****** Object:  Default [DF_Product_Name]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Product_Brand]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Brand]  DEFAULT ('') FOR [Brand]
GO
/****** Object:  Default [DF_Product_Type]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Type]  DEFAULT ('') FOR [Type]
GO
/****** Object:  Default [DF_Product_Description]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Description]  DEFAULT ('') FOR [Description]
GO
/****** Object:  Default [DF_Product_Content]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Content]  DEFAULT ('') FOR [Content]
GO
/****** Object:  Default [DF_Product_ImgUrl]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ImgUrl]  DEFAULT ('') FOR [ImgUrl]
GO
/****** Object:  Default [DF_Product_ThumbUrl]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ThumbUrl]  DEFAULT ('') FOR [ThumbUrl]
GO
/****** Object:  Default [DF_Product_Status]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Product_Click]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Click]  DEFAULT ((0)) FOR [Click]
GO
/****** Object:  Default [DF_Product_SortIndex]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_SortIndex]  DEFAULT ((0)) FOR [SortIndex]
GO
/****** Object:  Default [DF_Product_CreateUserId]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateUserId]  DEFAULT ((0)) FOR [CreateUserId]
GO
/****** Object:  Default [DF_Product_CreateDate]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_Product_UpdateUserId]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_UpdateUserId]  DEFAULT ((0)) FOR [UpdateUserId]
GO
/****** Object:  Default [DF_Product_UpdateDate]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_新闻_CategoryId]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_新闻_CategoryId]  DEFAULT ((0)) FOR [CategoryId]
GO
/****** Object:  Default [DF_新闻_Title]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_新闻_Title]  DEFAULT ('') FOR [Title]
GO
/****** Object:  Default [DF_新闻_Content]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_新闻_Content]  DEFAULT ('') FOR [Content]
GO
/****** Object:  Default [DF_新闻_Status]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_新闻_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_新闻_Click]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_新闻_Click]  DEFAULT ((0)) FOR [Click]
GO
/****** Object:  Default [DF_新闻_CreateUserId]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_新闻_CreateUserId]  DEFAULT ((0)) FOR [CreateUserId]
GO
/****** Object:  Default [DF_新闻_CreateDate]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_新闻_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_新闻_UpdateUserId]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_新闻_UpdateUserId]  DEFAULT ((0)) FOR [UpdateUserId]
GO
/****** Object:  Default [DF_新闻_UpdateDate]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_新闻_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_FriendlyLink_Name]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[FriendlyLink] ADD  CONSTRAINT [DF_FriendlyLink_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_FriendlyLink_Url]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[FriendlyLink] ADD  CONSTRAINT [DF_FriendlyLink_Url]  DEFAULT ('') FOR [Url]
GO
/****** Object:  Default [DF_FriendlyLink_Status]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[FriendlyLink] ADD  CONSTRAINT [DF_FriendlyLink_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_FriendlyLink_SortIndex]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[FriendlyLink] ADD  CONSTRAINT [DF_FriendlyLink_SortIndex]  DEFAULT ((0)) FOR [SortIndex]
GO
/****** Object:  Default [DF_Message_Name]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Message_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Message_Email]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Message_Email]  DEFAULT ('') FOR [Email]
GO
/****** Object:  Default [DF_Message_QQ]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Message_QQ]  DEFAULT ((0)) FOR [QQ]
GO
/****** Object:  Default [DF_Message_Msg]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Message_Msg]  DEFAULT ('') FOR [Msg]
GO
/****** Object:  Default [DF_Message_CreateDate]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Message_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_Message_Status]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Message_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Message_ReplyMsg]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Message_ReplyMsg]  DEFAULT ('') FOR [ReplyMsg]
GO
/****** Object:  Default [DF_Message_ReplyUser]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Message_ReplyUser]  DEFAULT ((0)) FOR [ReplyUserId]
GO
/****** Object:  Default [DF_Message_ReplyDate]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Message_ReplyDate]  DEFAULT (getdate()) FOR [ReplyDate]
GO
/****** Object:  Default [DF_Config_Copyright]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_Copyright]  DEFAULT ('') FOR [Copyright]
GO
/****** Object:  Default [DF_Config_AboutImgUrl]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_AboutImgUrl]  DEFAULT ('') FOR [AboutImgUrl]
GO
/****** Object:  Default [DF_Config_AboutContent]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_AboutContent]  DEFAULT ('') FOR [AboutIntro]
GO
/****** Object:  Default [DF_Config_AboutUrl]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_AboutUrl]  DEFAULT ('') FOR [AboutUrl]
GO
/****** Object:  Default [DF_Config_NewsUrl]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_NewsUrl]  DEFAULT ('') FOR [NewsUrl]
GO
/****** Object:  Default [DF_Config_ContactImgUrl]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_ContactImgUrl]  DEFAULT ('') FOR [ContactImgUrl]
GO
/****** Object:  Default [DF_Config_ContactUrl]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_ContactUrl]  DEFAULT ('') FOR [ContactUrl]
GO
/****** Object:  Default [DF_Config_CompanyName]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_CompanyName]  DEFAULT ('') FOR [CompanyName]
GO
/****** Object:  Default [DF_Config_Address]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_Address]  DEFAULT ('') FOR [Address]
GO
/****** Object:  Default [DF_Config_Postcode]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_Postcode]  DEFAULT ((0)) FOR [Postcode]
GO
/****** Object:  Default [DF_Config_Telephone]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_Telephone]  DEFAULT ('') FOR [Telephone]
GO
/****** Object:  Default [DF_Config_Website]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_Website]  DEFAULT ('') FOR [Website]
GO
/****** Object:  Default [DF_Config_Email]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_Email]  DEFAULT ('') FOR [Email]
GO
/****** Object:  Default [DF_Config_ProductUrl]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Config] ADD  CONSTRAINT [DF_Config_ProductUrl]  DEFAULT ('') FOR [ProductUrl]
GO
/****** Object:  Default [DF_Category_Name]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_Category_Type]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Type]  DEFAULT ((1)) FOR [Type]
GO
/****** Object:  Default [DF_Category_ParentId]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ParentId]  DEFAULT ((0)) FOR [ParentId]
GO
/****** Object:  Default [DF_Category_Status]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Category_SortIndex]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_SortIndex]  DEFAULT ((0)) FOR [SortIndex]
GO
/****** Object:  Default [DF_Category_Url]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Url]  DEFAULT ('') FOR [Url]
GO
/****** Object:  Default [DF_Category_HasChildren]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_HasChildren]  DEFAULT ('') FOR [Content]
GO
/****** Object:  Default [DF_Category_IdPath]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_IdPath]  DEFAULT ('') FOR [IdPath]
GO
/****** Object:  Default [DF_Category_Depth]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Depth]  DEFAULT ((1)) FOR [Depth]
GO
/****** Object:  Default [DF_Category_HasChildren_1]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_HasChildren_1]  DEFAULT ((0)) FOR [HasChildren]
GO
/****** Object:  Default [DF_Banner_ImgUrl]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Banner] ADD  CONSTRAINT [DF_Banner_ImgUrl]  DEFAULT ('') FOR [ImgUrl]
GO
/****** Object:  Default [DF_Banner_Title]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Banner] ADD  CONSTRAINT [DF_Banner_Title]  DEFAULT ('') FOR [Title]
GO
/****** Object:  Default [DF_Banner_Url]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Banner] ADD  CONSTRAINT [DF_Banner_Url]  DEFAULT ('') FOR [Url]
GO
/****** Object:  Default [DF_Banner_Status]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Banner] ADD  CONSTRAINT [DF_Banner_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_Banner_SortIndex]    Script Date: 09/25/2016 19:35:17 ******/
ALTER TABLE [dbo].[Banner] ADD  CONSTRAINT [DF_Banner_SortIndex]  DEFAULT ((0)) FOR [SortIndex]
GO
