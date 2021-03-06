USE [Fake_Review]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendor](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[mname] [varchar](50) NULL,
	[hname] [varchar](50) NULL,
	[mobile] [varchar](50) NULL,
	[total_worker] [varchar](50) NULL,
	[address] [varchar](500) NULL,
	[emailid] [varchar](50) NULL,
 CONSTRAINT [PK_Vendor1] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_temp]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_temp](
	[pid] [varchar](50) NULL,
	[pname] [varchar](50) NULL,
	[price] [float] NULL,
	[pdesc] [varchar](50) NULL,
	[pdate] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[status] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registration]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registration](
	[userID] [varchar](50) NULL,
	[emailID] [varchar](50) NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[father_Name] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[dob] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[postal_Code] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[phone_no] [varchar](50) NULL,
	[rdate] [varchar](50) NULL,
	[image] [varchar](50) NULL,
	[utype] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[aadhar] [varchar](50) NULL,
	[fimg] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rating_db]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rating_db](
	[hid] [int] IDENTITY(1,1) NOT NULL,
	[hname] [varchar](50) NULL,
	[hrating] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_rating_db1] PRIMARY KEY CLUSTERED 
(
	[hid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[pid] [varchar](50) NULL,
	[pspl] [varchar](50) NULL,
	[pname] [varchar](50) NULL,
	[pdesc] [varchar](max) NULL,
	[pimage] [varchar](50) NULL,
	[pdate] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[userrat] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_review]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_review](
	[pname] [varchar](50) NULL,
	[preview] [varchar](50) NULL,
	[pstatus] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Positive_keyword]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Positive_keyword](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[positivekey] [varchar](50) NULL,
	[rank] [int] NULL,
 CONSTRAINT [PK_Positive_keyword] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Negative_keyword]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Negative_keyword](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[negativekey] [varchar](50) NULL,
	[rank] [int] NULL,
 CONSTRAINT [PK_Negative_keyword] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[emailid] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[utype] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[keyword]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[keyword](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pkeyword] [varchar](50) NULL,
	[nkeyword] [varchar](50) NULL,
 CONSTRAINT [PK_keyword1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feedback](
	[feedbackid] [int] IDENTITY(1,1) NOT NULL,
	[hname] [varchar](50) NOT NULL,
	[hdes] [varchar](500) NOT NULL,
	[rdate] [varchar](50) NOT NULL,
	[fuser] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_feedback1] PRIMARY KEY CLUSTERED 
(
	[feedbackid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cnf_order]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cnf_order](
	[pid] [varchar](50) NULL,
	[pname] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[pdesc] [varchar](50) NULL,
	[pdate] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[status] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category_details]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category_details](
	[cid] [int] NULL,
	[cat_name] [varchar](150) NOT NULL,
	[cname] [varchar](50) NULL,
 CONSTRAINT [PK_category_details] PRIMARY KEY CLUSTERED 
(
	[cat_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bot_replay]    Script Date: 03/26/2020 19:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bot_replay](
	[msg] [varchar](50) NULL,
	[rbot] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
