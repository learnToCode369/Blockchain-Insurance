USE [master]
GO
/****** Object:  Database [Insurance]    Script Date: 04/11/2019 15:58:48 ******/
CREATE DATABASE [Insurance] ON  PRIMARY 
( NAME = N'Insurance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Insurance.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Insurance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Insurance_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Insurance] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Insurance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Insurance] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Insurance] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Insurance] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Insurance] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Insurance] SET ARITHABORT OFF
GO
ALTER DATABASE [Insurance] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Insurance] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Insurance] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Insurance] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Insurance] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Insurance] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Insurance] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Insurance] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Insurance] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Insurance] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Insurance] SET  DISABLE_BROKER
GO
ALTER DATABASE [Insurance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Insurance] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Insurance] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Insurance] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Insurance] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Insurance] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Insurance] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Insurance] SET  READ_WRITE
GO
ALTER DATABASE [Insurance] SET RECOVERY FULL
GO
ALTER DATABASE [Insurance] SET  MULTI_USER
GO
ALTER DATABASE [Insurance] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Insurance] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Insurance', N'ON'
GO
USE [Insurance]
GO
/****** Object:  Table [dbo].[policy_master]    Script Date: 04/11/2019 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[policy_master](
	[p_id] [int] NULL,
	[policy_type] [nvarchar](50) NULL,
	[policy] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[policy_master] ([p_id], [policy_type], [policy]) VALUES (1, N'Four_Wheeler', N'Bajaj')
INSERT [dbo].[policy_master] ([p_id], [policy_type], [policy]) VALUES (2, N'Two_Wheeler', N'Policy_Bazar')
/****** Object:  Table [dbo].[new_policy]    Script Date: 04/11/2019 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[new_policy](
	[policy_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_id] [int] NOT NULL,
	[policy_number] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[policy_type] [nvarchar](50) NOT NULL,
	[policy] [nvarchar](50) NOT NULL,
	[purchase_date] [date] NOT NULL,
	[phno] [nvarchar](50) NOT NULL,
	[premium_amount] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[aadhar] [nvarchar](50) NULL,
	[form] [nvarchar](50) NULL,
	[policy_id_hash] [nvarchar](max) NULL,
 CONSTRAINT [PK_new_policy] PRIMARY KEY CLUSTERED 
(
	[policy_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[new_policy] ON
INSERT [dbo].[new_policy] ([policy_id], [cust_id], [policy_number], [name], [age], [policy_type], [policy], [purchase_date], [phno], [premium_amount], [start_date], [end_date], [aadhar], [form], [policy_id_hash]) VALUES (1, 1, N'123', N'Ankit', 24, N'Four_Wheeler', N'Policy_Bazar', CAST(0x9E3F0B00 AS Date), N'8605973598', 6000, CAST(0x883F0B00 AS Date), CAST(0xA53F0B00 AS Date), N'/AddharCard/Aroma.png', N'/UserForm/booked-.jpg', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b')
INSERT [dbo].[new_policy] ([policy_id], [cust_id], [policy_number], [name], [age], [policy_type], [policy], [purchase_date], [phno], [premium_amount], [start_date], [end_date], [aadhar], [form], [policy_id_hash]) VALUES (2, 2, N'465', N'suraj', 23, N'Four_Wheeler', N'Policy_Bazar', CAST(0x883F0B00 AS Date), N'8605982014', 4560, CAST(0x813F0B00 AS Date), CAST(0xA53F0B00 AS Date), N'/AddharCard/China10.png', N'/UserForm/circle-transparent.png', N'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35')
INSERT [dbo].[new_policy] ([policy_id], [cust_id], [policy_number], [name], [age], [policy_type], [policy], [purchase_date], [phno], [premium_amount], [start_date], [end_date], [aadhar], [form], [policy_id_hash]) VALUES (3, 3, N'711', N'xyz', 24, N'Four_Wheeler', N'Policy_Bazar', CAST(0x813F0B00 AS Date), N'8605973598', 6000, CAST(0x973F0B00 AS Date), CAST(0xA53F0B00 AS Date), N'/AddharCard/Aroma.png', N'/UserForm/blk-ratina.png', N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce')
INSERT [dbo].[new_policy] ([policy_id], [cust_id], [policy_number], [name], [age], [policy_type], [policy], [purchase_date], [phno], [premium_amount], [start_date], [end_date], [aadhar], [form], [policy_id_hash]) VALUES (4, 4, N'897', N'sunil', 23, N'Four_Wheeler', N'Policy_Bazar', CAST(0x963F0B00 AS Date), N'8605973598', 6000, CAST(0x8F3F0B00 AS Date), CAST(0xA53F0B00 AS Date), N'/AddharCard/csup.png', N'/UserForm/booked-.jpg', N'4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a')
SET IDENTITY_INSERT [dbo].[new_policy] OFF
/****** Object:  Table [dbo].[manage_policy]    Script Date: 04/11/2019 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manage_policy](
	[manage_id] [int] IDENTITY(1,1) NOT NULL,
	[policy_type] [nvarchar](50) NOT NULL,
	[policy] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_manage_policy] PRIMARY KEY CLUSTERED 
(
	[manage_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[manage_policy] ON
INSERT [dbo].[manage_policy] ([manage_id], [policy_type], [policy], [description]) VALUES (1, N'Two_Wheeler', N'Policy_Bazar', N'rghder')
INSERT [dbo].[manage_policy] ([manage_id], [policy_type], [policy], [description]) VALUES (2, N'Four_Wheeler', N'Bajaj', N'r433w4')
SET IDENTITY_INSERT [dbo].[manage_policy] OFF
/****** Object:  Table [dbo].[Log_Table]    Script Date: 04/11/2019 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_Table](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[cust] [int] NULL,
	[hash] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[date_a_paid] [date] NULL,
 CONSTRAINT [PK_Log_Table] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Log_Table] ON
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (1, 1, N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Registration', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (2, 1, N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'New Policy', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (3, 1, N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Apply For Claim', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (5, 1, N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Claim By Admin', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (6, 2, N'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', N'Registration', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (7, 2, N'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', N'New Policy', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (8, 2, N'5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', N'Apply For Claim', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (9, 2, N'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', N'Claim By Admin', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (10, 3, N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce', N'Registration', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (11, 3, N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce', N'New Policy', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (12, 3, N'5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', N'Apply For Claim', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (13, 3, N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce', N'Claim By Admin', CAST(0x813F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (14, 4, N'4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a', N'Registration', CAST(0x843F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (15, 4, N'4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a', N'New Policy', CAST(0x843F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (16, 4, N'5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9', N'Apply For Claim', CAST(0x843F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (17, 4, N'4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a', N'Claim By Admin', CAST(0x843F0B00 AS Date))
INSERT [dbo].[Log_Table] ([log_id], [cust], [hash], [Type], [date_a_paid]) VALUES (18, 5, N'ef2d127de37b942baad06145e54b0c619a1f22327b2ebbcfbec78f5564afe39d', N'Registration', CAST(0x873F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Log_Table] OFF
/****** Object:  Table [dbo].[customer_master]    Script Date: 04/11/2019 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_master](
	[cust_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phno] [nvarchar](50) NOT NULL,
	[emailId] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[cust_id_hash] [nvarchar](max) NULL,
 CONSTRAINT [PK_customer_master] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[customer_master] ON
INSERT [dbo].[customer_master] ([cust_id], [cust_name], [address], [phno], [emailId], [password], [cust_id_hash]) VALUES (1, N'Ankit', N'kandivali', N'8605973598', N'ankitkesarwani122@gmail.com', N'gnZRJMUh', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b')
INSERT [dbo].[customer_master] ([cust_id], [cust_name], [address], [phno], [emailId], [password], [cust_id_hash]) VALUES (2, N'suraj', N'kandivali', N'8605982014', N'suraj@gmail.com', N'i7tWerme', N'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35')
INSERT [dbo].[customer_master] ([cust_id], [cust_name], [address], [phno], [emailId], [password], [cust_id_hash]) VALUES (3, N'xyz', N'kandivali', N'8605973598', N'xyz@gmail.com', N'EYiTknBe', N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce')
INSERT [dbo].[customer_master] ([cust_id], [cust_name], [address], [phno], [emailId], [password], [cust_id_hash]) VALUES (4, N'sunil', N'kandivali', N'8605973598', N'sunil@gmail.com', N'nwnDq577', N'4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a')
SET IDENTITY_INSERT [dbo].[customer_master] OFF
/****** Object:  Table [dbo].[apply_for_claim]    Script Date: 04/11/2019 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apply_for_claim](
	[claim_id] [int] IDENTITY(1,1) NOT NULL,
	[cust_id] [int] NOT NULL,
	[policy_number] [nvarchar](50) NOT NULL,
	[policy_type] [nvarchar](50) NOT NULL,
	[policy] [nvarchar](50) NOT NULL,
	[phno] [nvarchar](50) NOT NULL,
	[emailId] [nvarchar](50) NOT NULL,
	[claim_amount] [nvarchar](50) NOT NULL,
	[end_date] [date] NOT NULL,
	[claim_id_hash] [nvarchar](max) NULL,
 CONSTRAINT [PK_apply_for_claim] PRIMARY KEY CLUSTERED 
(
	[claim_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[apply_for_claim] ON
INSERT [dbo].[apply_for_claim] ([claim_id], [cust_id], [policy_number], [policy_type], [policy], [phno], [emailId], [claim_amount], [end_date], [claim_id_hash]) VALUES (1, 1, N'123', N'Four_Wheeler', N'Policy_Bazar', N'8605973598', N'ankitkesarwani122@gmail.com', N'4500', CAST(0xA53F0B00 AS Date), N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b')
INSERT [dbo].[apply_for_claim] ([claim_id], [cust_id], [policy_number], [policy_type], [policy], [phno], [emailId], [claim_amount], [end_date], [claim_id_hash]) VALUES (2, 2, N'465', N'Four_Wheeler', N'Policy_Bazar', N'8605982014', N'suraj@gmail.com', N'3000', CAST(0xA53F0B00 AS Date), N'5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9')
INSERT [dbo].[apply_for_claim] ([claim_id], [cust_id], [policy_number], [policy_type], [policy], [phno], [emailId], [claim_amount], [end_date], [claim_id_hash]) VALUES (3, 3, N'711', N'Four_Wheeler', N'Policy_Bazar', N'8605973598', N'xyz@gmail.com', N'4500', CAST(0xA53F0B00 AS Date), N'5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9')
INSERT [dbo].[apply_for_claim] ([claim_id], [cust_id], [policy_number], [policy_type], [policy], [phno], [emailId], [claim_amount], [end_date], [claim_id_hash]) VALUES (4, 4, N'897', N'Four_Wheeler', N'Policy_Bazar', N'8605973598', N'sunil@gmail.com', N'4500', CAST(0xA53F0B00 AS Date), N'5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9')
SET IDENTITY_INSERT [dbo].[apply_for_claim] OFF
/****** Object:  Table [dbo].[amount_paid_by_admin]    Script Date: 04/11/2019 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amount_paid_by_admin](
	[claimpay_id] [int] IDENTITY(1,1) NOT NULL,
	[policy_number] [nvarchar](50) NULL,
	[policy_holder_name] [nvarchar](50) NULL,
	[phno] [nvarchar](50) NULL,
	[emailid] [nvarchar](50) NULL,
	[claim_amount] [int] NULL,
	[get_amount] [int] NULL,
	[claimpay_id_hash] [nvarchar](max) NULL,
	[cust_id] [int] NULL,
 CONSTRAINT [PK_amount_paid_by_admin] PRIMARY KEY CLUSTERED 
(
	[claimpay_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[amount_paid_by_admin] ON
INSERT [dbo].[amount_paid_by_admin] ([claimpay_id], [policy_number], [policy_holder_name], [phno], [emailid], [claim_amount], [get_amount], [claimpay_id_hash], [cust_id]) VALUES (1, N'123', N'Ankit', N'8605973598', N'ankitkesarwani122@gmail.com', 4500, 3000, N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 1)
INSERT [dbo].[amount_paid_by_admin] ([claimpay_id], [policy_number], [policy_holder_name], [phno], [emailid], [claim_amount], [get_amount], [claimpay_id_hash], [cust_id]) VALUES (2, N'123', N'Ankit', N'8605973598', N'ankitkesarwani122@gmail.com', 4500, 1000, N'd4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35', 2)
INSERT [dbo].[amount_paid_by_admin] ([claimpay_id], [policy_number], [policy_holder_name], [phno], [emailid], [claim_amount], [get_amount], [claimpay_id_hash], [cust_id]) VALUES (3, N'711', N'xyz', N'8605973598', N'xyz@gmail.com', 4500, 500, N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce', 3)
INSERT [dbo].[amount_paid_by_admin] ([claimpay_id], [policy_number], [policy_holder_name], [phno], [emailid], [claim_amount], [get_amount], [claimpay_id_hash], [cust_id]) VALUES (4, N'897', N'sunil', N'8605973598', N'sunil@gmail.com', 4500, 1200, N'4b227777d4dd1fc61c6f884f48641d02b4d121d3fd328cb08b5531fcacdabf8a', 4)
SET IDENTITY_INSERT [dbo].[amount_paid_by_admin] OFF
/****** Object:  Table [dbo].[admin_master]    Script Date: 04/11/2019 15:58:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username_] [varchar](max) NULL,
	[password_] [varchar](max) NULL,
 CONSTRAINT [PK_admin_master] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admin_master] ON
INSERT [dbo].[admin_master] ([id], [username_], [password_]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[admin_master] OFF
