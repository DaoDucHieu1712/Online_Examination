USE [Online_Examination]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](150) NULL,
	[gender] [bit] NULL,
	[dob] [date] NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](1000) NULL,
	[email] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[display_name] [nvarchar](1000) NULL,
	[department_id] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_exam] [nvarchar](150) NULL,
	[time] [int] NULL,
	[quantity_quiz] [int] NULL,
	[course_id] [int] NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](150) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Account]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Account](
	[account_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
 CONSTRAINT [PK_Group_Account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Feature]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Feature](
	[group_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
 CONSTRAINT [PK_Group_Feature] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz] [nvarchar](4000) NULL,
	[op1] [nvarchar](4000) NULL,
	[op2] [nvarchar](4000) NULL,
	[op3] [nvarchar](4000) NULL,
	[op4] [nvarchar](4000) NULL,
	[solution] [int] NULL,
	[course_id] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 2/19/2022 10:51:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[account_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[score] [float] NULL,
	[status] [nvarchar](150) NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC,
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [full_name], [gender], [dob], [phone], [address], [email], [password]) VALUES (1, N'Đào Đức Hiếu', 1, CAST(N'2001-12-17' AS Date), N'0916058692', N'Đại Thịnh - Mê Linh - Hà Nội', N'hieu123@gmail.com', N'123456')
INSERT [dbo].[Account] ([id], [full_name], [gender], [dob], [phone], [address], [email], [password]) VALUES (2, N'Trần Anh Minh', 1, CAST(N'2001-12-04' AS Date), N'0999999999', N'Vinh Tân - TPVinh - Nghệ An', N'minh123@gmail.com', N'123456')
INSERT [dbo].[Account] ([id], [full_name], [gender], [dob], [phone], [address], [email], [password]) VALUES (3, N'Nguyễn Anh Đức', 0, CAST(N'2001-08-08' AS Date), N'0912321312', N'Thạch Hòa - Thạch Thất -Hòa Lạc', N'duc123@gmail.com', N'123456')
INSERT [dbo].[Account] ([id], [full_name], [gender], [dob], [phone], [address], [email], [password]) VALUES (7, N'Duong Quang Thanh', 1, CAST(N'2022-02-10' AS Date), N'0123456789', N'Xuan Dinh - Ha Noi', N'thanh123@gmail.com', N'123456')
INSERT [dbo].[Account] ([id], [full_name], [gender], [dob], [phone], [address], [email], [password]) VALUES (8, N'Hoc Sinh A', 1, CAST(N'2001-01-21' AS Date), N'0123456789', N'Thach Hoa - Thach That - Ha Noi', N'student1@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [name], [display_name], [department_id]) VALUES (1, N'PRO192', N'Object-Oriented Programming', 1)
INSERT [dbo].[Course] ([id], [name], [display_name], [department_id]) VALUES (2, N'NWC203c', N'Network Connetivity', 2)
INSERT [dbo].[Course] ([id], [name], [display_name], [department_id]) VALUES (3, N'PFP192', N'Programming Fundamentals with Python', 3)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([id], [name]) VALUES (1, N'Computing Fundamental')
INSERT [dbo].[Department] ([id], [name]) VALUES (2, N'Information Assurance')
INSERT [dbo].[Department] ([id], [name]) VALUES (3, N'Artificial Intelligence')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([id], [url]) VALUES (1, N'/login')
INSERT [dbo].[Feature] ([id], [url]) VALUES (2, N'/logout')
INSERT [dbo].[Feature] ([id], [url]) VALUES (3, N'/account/update')
INSERT [dbo].[Feature] ([id], [url]) VALUES (4, N'/account/search')
INSERT [dbo].[Feature] ([id], [url]) VALUES (5, N'/account/list')
INSERT [dbo].[Feature] ([id], [url]) VALUES (6, N'/account/detail')
INSERT [dbo].[Feature] ([id], [url]) VALUES (7, N'/account/delete')
INSERT [dbo].[Feature] ([id], [url]) VALUES (8, N'/question/list')
INSERT [dbo].[Feature] ([id], [url]) VALUES (9, N'/question/detail')
INSERT [dbo].[Feature] ([id], [url]) VALUES (10, N'/question/update')
INSERT [dbo].[Feature] ([id], [url]) VALUES (11, N'/question/delete')
INSERT [dbo].[Feature] ([id], [url]) VALUES (12, N'/question/search')
INSERT [dbo].[Feature] ([id], [url]) VALUES (13, N'/course/list')
INSERT [dbo].[Feature] ([id], [url]) VALUES (14, N'/course/detail')
INSERT [dbo].[Feature] ([id], [url]) VALUES (15, N'/course/update')
INSERT [dbo].[Feature] ([id], [url]) VALUES (16, N'/course/delete')
INSERT [dbo].[Feature] ([id], [url]) VALUES (17, N'/course/search')
INSERT [dbo].[Feature] ([id], [url]) VALUES (18, N'/exam/list')
INSERT [dbo].[Feature] ([id], [url]) VALUES (19, N'/exam/detail')
INSERT [dbo].[Feature] ([id], [url]) VALUES (20, N'/exam/update ')
INSERT [dbo].[Feature] ([id], [url]) VALUES (21, N'/exam/delete ')
INSERT [dbo].[Feature] ([id], [url]) VALUES (22, N'/exam/search')
INSERT [dbo].[Feature] ([id], [url]) VALUES (23, N'/exam/doExam')
INSERT [dbo].[Feature] ([id], [url]) VALUES (24, N'/exam/result')
INSERT [dbo].[Feature] ([id], [url]) VALUES (25, N'/exam/solution')
INSERT [dbo].[Feature] ([id], [url]) VALUES (26, N'/feedback/list ')
INSERT [dbo].[Feature] ([id], [url]) VALUES (27, N'/feedback/insert')
INSERT [dbo].[Feature] ([id], [url]) VALUES (28, N'/changePassword')
INSERT [dbo].[Feature] ([id], [url]) VALUES (29, N'/feedback/delete')
INSERT [dbo].[Feature] ([id], [url]) VALUES (30, N'/feedback/detail')
SET IDENTITY_INSERT [dbo].[Feature] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([id], [group_name]) VALUES (1, N'teacher')
INSERT [dbo].[Group] ([id], [group_name]) VALUES (2, N'student')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
INSERT [dbo].[Group_Account] ([account_id], [group_id]) VALUES (1, 1)
INSERT [dbo].[Group_Account] ([account_id], [group_id]) VALUES (2, 2)
INSERT [dbo].[Group_Account] ([account_id], [group_id]) VALUES (3, 2)
INSERT [dbo].[Group_Account] ([account_id], [group_id]) VALUES (7, 2)
INSERT [dbo].[Group_Account] ([account_id], [group_id]) VALUES (8, 2)
GO
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 3)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 4)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 5)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 6)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 7)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 8)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 9)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 10)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 11)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 12)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 13)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 14)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 15)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 16)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 17)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 18)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 19)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 20)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 21)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 22)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 23)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 24)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 25)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 26)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 28)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 29)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (1, 30)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 3)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 13)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 14)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 17)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 18)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 19)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 22)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 23)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 24)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 25)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 27)
INSERT [dbo].[Group_Feature] ([group_id], [feature_id]) VALUES (2, 28)
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([department_id])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[Group_Account]  WITH CHECK ADD  CONSTRAINT [FK_Group_Account_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Group_Account] CHECK CONSTRAINT [FK_Group_Account_Account]
GO
ALTER TABLE [dbo].[Group_Account]  WITH CHECK ADD  CONSTRAINT [FK_Group_Account_Group] FOREIGN KEY([group_id])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[Group_Account] CHECK CONSTRAINT [FK_Group_Account_Group]
GO
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Feature] FOREIGN KEY([feature_id])
REFERENCES [dbo].[Feature] ([id])
GO
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Feature]
GO
ALTER TABLE [dbo].[Group_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Group_Feature_Group] FOREIGN KEY([group_id])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[Group_Feature] CHECK CONSTRAINT [FK_Group_Feature_Group]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Course]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Exam] FOREIGN KEY([course_id])
REFERENCES [dbo].[Exam] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Exam]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Account]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Exam] FOREIGN KEY([exam_id])
REFERENCES [dbo].[Exam] ([id])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Exam]
GO
