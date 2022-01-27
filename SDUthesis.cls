%% 提供该模版的运行基础
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
% 版本说明
\ProvidesClass{SDUthesis}[2011/10/01 v1.0 SDUthesis document class]
% 基于ctexbook模版，增加专有内容
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
% 2009/09/13的v0.94及之后版本提供了hyperref的支持，直接写入选项即可
\LoadClass[cs4size,a4paper,fancyhdr,hyperref]{ctexbook}[2009/09/13]
%% math packages 数学公式包，非数学系可无视之
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
%% graphicx packages，psgrag用于修改eps图中的信息，但与dvipdfm不兼容
\RequirePackage{graphicx}
% 需要times包，让英文字体看起来更像windows下
\RequirePackage{times}
% 需要array包，排姓名导师信息时用
\RequirePackage{array}
% 需要tocloft包，调整目录显示格式时使用，LaTeX2e默认的格式不符合模版要求
\RequirePackage[titles]{tocloft}
% tocloft包需要tocbibind包来配合，同时tocloft包需要titles参数来将其置为chapter title
% nottoc表示不把目录 作为一部分放进目录中
\RequirePackage[chapter,nottoc]{tocbibind}
% 需要索引功能，加入索引包
\RequirePackage{makeidx}
% 参考文献格式调整需要natbib包
% sort&compress参数用于按引用顺序排列参考文献
% longnamesfirst参数用于处理长人名顺序，将first name排前面，用于外国人名
% square参数，引用标号用方括号括起
% super参数，引用标号为上标格式
% comma参数，引用标号之间为逗号
\RequirePackage[sort&compress,longnamesfirst,square,super,comma]{natbib}
% 设置图片，表格头字体选项。间距10pt，字号为小字号，加粗字体，标题与题目间距1个字符
\RequirePackage[margin=10pt,font={small,bf},labelsep=quad]{caption}
% 粗线型表格需要的扩展包
\RequirePackage{booktabs-de}
% 计算宽度使用的包
\RequirePackage{calc}
% 合并表格行用到的包
\RequirePackage{multirow}
% 可以在图像上标注
\RequirePackage[abs]{overpic}
% 算法描述
\RequirePackage{enumerate}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{natbib}
% PDF文档超链接及书签标记，具体选项意义参考hyperref说明文档
% hyperref包要2011年版的才行
% 表格内换行
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

\hypersetup
{
	CJKbookmarks=true,%
	bookmarksnumbered,%
	linkcolor=blue,%
	plainpages=false,%
	pdfstartview=FitH,
	hidelinks
}
% 文档开始导入默认配置
\AtBeginDocument{\makeatletter\input{SDUthesis.cfg}\makeatother}

%%% 页与页边距设置
\oddsidemargin 0.6 true cm
% 偶数页的左边距设置则分双面模式与单面模式两种情况
\if@twoside
  \evensidemargin 0.6 true cm
\else
  \evensidemargin 0.6 true cm
\fi
% 设置页头空白尺寸
\topmargin -1.07 true cm
% \headheight 0.8 true cm
% \headsep 0.5 true cm
% \topsep 0.7 true cm
\textheight 24.1 true cm
\textwidth 14.73 true cm
% \footskip 0.9 true cm
% \parskip 0.5ex plus 0.25ex minus 0.25ex

% cleardoublepage这个命令的定义
\def\cleardoublepage
{
\clearpage
	\if@twoside
		\ifodd
			\c@page
		\else
			\thispagestyle{empty}%
			\hbox{}\newpage
			\if@twocolumn
				\hbox{}\newpage
			\fi
		\fi
	\fi
}

% cleardoublepage这个命令的定义
% \def\cleardoublepage
% {
% 	\clearpage
% 	\if@twoside
% 		\ifodd
% 			\c@page
% 		\else
% 			\thispagestyle{empty}%
% 			\hbox{}\newpage
% 			\if@twocolumn
% 				\hbox{}\newpage
% 			\fi
% 		\fi
% 	\fi
% }


% 这个地方定义一页中浮动对象可占的最大比例
% 一页中放下更多图像
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}
\renewcommand{\textfraction}{0.01}
\renewcommand{\topfraction}{0.99}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


%\renewcommand\NAT@onlinecite[3]{\ifNAT@swa%
%  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
%  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
%\DeclareRobustCommand\onlinecite{\@onlinecite}
%\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
%\def\thudot{\ifthu@bachelor\else\unskip.\fi}
%\def\thumasterbib{\ifthu@doctor [M]\else [Master Thesis]\fi}
%\def\thuphdbib{\ifthu@doctor [D]\else [Doctor Thesis]\fi}
%




\newcommand\SDUspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\reserved@a#1 #2 #3\@nil
{
	\def\SDUfiledate{#1}%
	\def\SDUfileversion{#2}%
	\def\SDUfileinfo{#3}
}%
\edef\reserved@b{\csname ver@SDUthesis.cls\endcsname}
\expandafter\reserved@a\reserved@b\@nil\relax

% 新命令Nchapter的定义
% 这里的mainmatter对应于tex文档中的定义
\newcommand\Nchapter[1]
{
\if@mainmatter%
	\@mainmatterfalse%
	\chapter{#1}%
	\@mainmattertrue%
\else
	\chapter{#1}%
\fi
}

% 下划线的一个定义
\def\SDU@underline[#1]#2{%
\underline{\hbox to #1{\hfil#2\hfil}}}
\def\SDUunderline{\@ifnextchar[\SDU@underline\underline}

%%%封面内容
\newcommand\classification[1]{\def\SDU@value@classification{#1}}
\newcommand\serialnumber[1]{\def\SDU@value@serialnumber{#1 \hspace{1.9cm}}}
\newcommand\SecretLevel[1]{%
\def\SDU@value@SecretLevel{#1}
\def\SDU@value@IsSecret{1}}
\newcommand\PersonalID[1]{\def\SDU@value@PersonalID{#1 \hspace{0.9cm}}}
\newcommand\degree[1]{\def\SDU@value@degree{#1}}
\renewcommand\title[2][\SDU@value@title]{%
\def\SDU@value@title{#2}
\def\SDU@value@titlemark{\MakeUppercase{#1}}}
\newcommand\Etitle[1]{\def\SDU@value@Etitle{\MakeUppercase{#1}}}
\newcommand\EtitleSecondLine[1]{\def\SDU@value@EtitleSecondLine{\MakeUppercase{#1}}}
\newcommand\EtitleThirdLine[1]{\def\SDU@value@EtitleThirdLine{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\SDU@value@author{#1}}
\newcommand\institute[1]{\def\SDU@value@institute{#1}}
\newcommand\major[1]{\def\SDU@value@major{#1}}
\newcommand\supervisor[1]{\def\SDU@value@supervisor{#1}}
\newcommand\cpsupervisor[1]{\def\SDU@value@cpsupervisor{#1}}
\newcommand\submitdate[1]{\def\SDU@value@submitdate{#1}}
%%% 制作封面的命令
\newcommand\makeCoverPage
{% 这个地方写的是封面上的分类号与学号，字体字号可以更改
\pagenumbering{alph}
\cleardoublepage
\thispagestyle{empty}
{
  %分类号， 单位代码，密级，学号
	\bfseries\heiti\zihao{4}
	\begin{center}
		\SDU@label@classification
		\SDU@value@classification
		\hfill
		\SDU@label@serialnumber
		\SDU@value@serialnumber \hspace{0em} \\
		\vspace{0.8mm}
		
		\SDU@label@SecretLevel
		\ifx\SDU@value@SecretLevel\undefined
		\else
			\SDU@value@SecretLevel
		\fi
		\hfill
		\SDU@label@PersonalID
		\SDU@value@PersonalID \hspace{0em}
		
		% 这个尺寸可以更改
		\vspace{2cm}
		
		% 山东东大学校徽
		\ifpdf
			\includegraphics[width=2.9cm]{./CoverPagepic/badge.png}
		\else
			\includegraphics[width=2cm]{./CoverPagepic/badge.eps}
		\fi
		% 山东大学四个字，山大doc模板竟然不按原比例放缩图像，在此不做放缩
		%
		\ifpdf
			\includegraphics[width=9.3cm]{./CoverPagepic/sdu.png} \\
		\else
			\includegraphics[width=9.3cm]{./CoverPagepic/sdu.eps} \\
		\fi
		
		% 这个尺寸可以更改
		\vspace{1.25cm}
		
		\scalebox{1}[1.25]{\bfseries\heiti\fontsize{40pt}{\baselineskip}\selectfont{\SDU@value@degree\SDU@label@thesisOnCover}}\\
         \vspace{0.5cm}
        \scalebox{1}{\fontsize{16pt}{\baselineskip}\selectfont {Dissertation for Doctoral Degree}}
		% 这个尺寸可以更改
		\vspace{1.35cm}
	
		% 论文题目部分内容，可以修改
		\begin{tabular}{ll}
			{\scalebox{0.85}[1]{\bfseries\heiti\zihao{-2}{\SDU@label@title:}}\vspace{0.12cm}}
			&
			{\bfseries\heiti\zihao{-2}{\SDU@value@title}\vspace{0.12cm}} \\
			&
			{\bfseries\heiti\zihao{3}{\SDU@value@Etitle}\vspace{0.12cm}}\\
			&
			%同样是英文标题的多行判断，如果一行写不下，有第二行显示，否则不显示第二行
			\ifx\SDU@value@EtitleSecondLine\undefined
			\hfil
			\else
			{\bfseries\heiti\zihao{3}{\SDU@value@EtitleSecondLine}\vspace{0.12cm}}
			\fi\\
			&
			%同样是英文标题的多行判断，如果二行写不下，有第三行显示，否则不显示第三行
			\ifx\SDU@value@EtitleThirdLine\undefined
			\hfil
			\else
			{\bfseries\heiti\zihao{3}{\SDU@value@EtitleThirdLine}}
			\fi\\			
		\end{tabular}
		
		% 这个距离可以修改
		\vspace{1cm}
		
		%作者，学院，专业，导师，合作导师	
		\newcolumntype{A}{>{}r<{}}
		\newcolumntype{B}{>{}l<{}}
				
		\begin{tabular}{A@{\quad}B}
			\hspace{1.5cm}\scalebox{0.9}[1]{\songti\zihao{-3}\SDU@label@author}
			&
			\SDUunderline[190pt]{\heiti\zihao{4}\SDU@value@author} \vspace{0.1cm} \\
			\hspace{1.5cm}\scalebox{0.9}[1]{\songti\zihao{-3}\SDU@label@institute}
			&
			\SDUunderline[190pt]{\heiti\zihao{4}\SDU@value@institute} \vspace{0.1cm} \\
		    \hspace{1.5cm}\scalebox{0.9}[1]{\songti\zihao{-3}\SDU@label@major}
		     &
		     \SDUunderline[190pt]{\heiti\zihao{4}\SDU@value@major} \vspace{0.1cm} \\
			 \hspace{1.5cm}\scalebox{0.9}[1]{\songti\zihao{-3}\SDU@label@supervisor}
			 &
			\SDUunderline[190pt]{\heiti\zihao{4}\SDU@value@supervisor} \vspace{0.1cm} \\
			 \hspace{1.5cm}\scalebox{0.9}[1]{\songti\zihao{-3}\SDU@label@cpsupervisor}
			&
			\ifx\SDU@value@cpsupervisor\undefined
				\SDUunderline[190pt]{\heiti\zihao{4}{}} \vspace{0.1cm} \\
			\else
				\SDUunderline[190pt]{\heiti\zihao{4}\SDU@value@cpsupervisor} \vspace{0.1cm} \\
			\fi			
		\end{tabular}
		
		\vfill
		
		% 日期
		\bfseries\heiti\zihao{4}\SDU@value@submitdate
		\vspace{0.5cm}
	\end{center}
}
}

% 英文页面内容

\newcommand\Edegree[1]{\def\SDU@value@Edegree{#1}}
\newcommand\Eauthor[1]{\def\SDU@value@Eauthor{#1}}
\newcommand\Esupervisor[1]{\def\SDU@value@Esupervisor{#1}}
\newcommand\Esubmitdate[1]{\def\SDU@value@Esubmitdate{#1}}

% 这个地方插入了英文标题页
\newcommand\makeEnglishTitlePage
{%% 注意这个cleardoublepage的用法
	\cleardoublepage
	\thispagestyle{empty}

	\linespread{1.5}
	\centerline{}
	\vspace{0.45cm}
		
	\begin{center}
		% 英文论文题目
		\bf\zihao{3}\SDU@value@Etitle\\
		\ifx\SDU@value@EtitleSecondLine\undefined
		\hfil\\
		\else
		{\bf\zihao{3}{\SDU@value@EtitleSecondLine}}
		\fi
		\ifx\SDU@value@EtitleThirdLine\undefined
		\hfil\\
		\else
		{\bf\zihao{3}{\SDU@value@EtitleThirdLine}}
		\fi
		
		\vspace{3.8cm}

		\textnormal{\zihao{-3}by}\\
		\bf\zihao{-3}\SDU@value@Eauthor\\
		% 导师英文签名
		\bf\zihao{-3}Supervisor:~\SDU@value@Esupervisor\\
		
		\vspace{3.5cm}
		
		\bf\zihao{-3}For the degree of\\
		\bf\zihao{-3}Doctor of Philosophy
		
		\vspace{5.5cm}
		
		%\bf\zihao{-3}\SDU@value@Eaddress\\
		\bf\zihao{-3}\SDU@value@Esubmitdate
	\end{center}
}

% 独创声明与版权协议转让页
\newcommand\makeOSandCPRTpage
{%
	\cleardoublepage
	\thispagestyle{empty}
	
	\linespread{1.6}
	
	\centerline{}
	\vspace{-0.3cm}
	
	% 头上几行空白
	\begin{center}
		\bf\songti\zihao{-3}{原创性声明和关于论文使用授权的说明}\\
		\vspace{1cm}
		\bf\songti\zihao{3}{原~~创~~性~~声~~明}
	\end{center}
	
	\vspace{-0.2cm}
	
	\songti\zihao{4}
	本人郑重声明：所呈交的学位论文，是本人在导师的指导下，独立进行研究所取得的成果。
	除文中已经注明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的科研成果。
	对本文的研究作出重要贡献的个人和集体，均已在文中以明确方式标明。
	本声明的法律责任由本人承担。
		
	\vspace{0.4cm}

	\begin{center}
	\songti\zihao{4}论文作者签名：\SDUunderline[100pt]{}\quad\quad日\quad期：\SDUunderline[80pt]{}
	\end{center}
		
	\vspace{1.5cm}
	
	\begin{center}
	\bf\songti\zihao{3}{关于学位论文使用授权的声明}				
	\end{center}
	
	\vspace{-0.2cm}
	
	\songti\zihao{4}
	本人完全了解山东大学有关保留、使用学位论文的规定，
	同意学校保留或向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅；
	本人授权山东大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，
	可以采用影印、缩印或其他复制手段保存论文和汇编本学位论文。
	
	\vspace{0.2cm}
	(保密论文在解密后应遵守此规定)
	
	\vspace{1.4cm}
	
	\begin{center}	
		\songti\zihao{4}论文作者签名：\SDUunderline[65pt]{}导师签名：\SDUunderline[65pt]{}日\quad期：\SDUunderline[60pt]{}
	\end{center}
}

\newcommand\SDUfrontmatter{%
\frontmatter
% 正文内容前的部分页码格式为大写罗马数字
\pagenumbering{roman}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 正文字体设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\songti
\zihao{-4}
}

\newcommand\SDUmainmatter{%
\mainmatter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 正文字体设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\songti
\zihao{-4}
}

\newcommand\SDUbackmatter{%
\backmatter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 正文字体设定
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\songti
\zihao{-4}
}

% 空页眉页的格式定义
% 每一个chapter开始的第一页的页眉页脚样式为plain样式
\fancypagestyle{plain}{%
\fancyhf{}% 先清除当前页面的页眉页脚定义，是fancyhdr包中的定义
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
\if@twoside
\fancyhead[CE]{\bf\songti\zihao{3}\ziju{0.2}\SDU@value@school\SDU@value@degree\SDU@label@thesis}
\fancyhead[CO]{\bf\songti\zihao{3}\ziju{0.2}\SDU@value@school\SDU@value@degree\SDU@label@thesis}
\fancyfoot[RO]{\zihao{-5} ~\thepage~}
\fancyfoot[LE]{\zihao{-5} ~\thepage~}
\else
\fancyhead[L]{\bf\songti\zihao{3}\ziju{0.2}\SDU@value@school\SDU@value@degree\SDU@label@thesis}
\fancyhead[R]{\bf\songti\zihao{3}\ziju{0.2}\SDU@value@school\SDU@value@degree\SDU@label@thesis}
\fancyfoot[C]{\zihao{-5} ~\thepage~}
\fi
}

\renewcommand{\headrule}{%定义正文页页眉线绘制命令
\makebox[0pt][l]{\rule[0.7\baselineskip]{\headwidth}{1.2pt}}%
\rule[0.6\baselineskip]{\headwidth}{0.5pt}\vskip-0.8\baselineskip}

\renewcommand{\footrule}{
\makebox[0pt][l]{\rule[0.55\baselineskip]{\headwidth}{1.2pt}}}

% L靠左 R靠右 O奇数页 E偶数页
% 一般页的页眉页脚样式
\pagestyle{fancy}
\fancyhf{} %fancyhf实际是fancyhead与fancyfoot的合体，它的参数用H和F指定
% 分单双面判断页眉的设置
\if@twoside
\fancyhead[CE]{\bf\songti\zihao{3}\ziju{0.2}\SDU@value@school\SDU@value@degree\SDU@label@thesis}
\fancyhead[CO]{\bf\songti\zihao{3}\ziju{0.2}\SDU@value@school\SDU@value@degree\SDU@label@thesis}
\fancyfoot[RO]{\zihao{-5} ~\thepage~}
\fancyfoot[LE]{\zihao{-5} ~\thepage~}
\else
\fancyhead[L]{\bf\songti\zihao{3}\ziju{0.2}\SDU@value@school\SDU@value@degree\SDU@label@thesis}
\fancyhead[R]{\bf\songti\zihao{3}\ziju{0.2}\SDU@value@school\SDU@value@degree\SDU@label@thesis}
\fancyfoot[C]{\zihao{-5} ~\thepage~}
\fi


% 设置章节标题格式
\CTEXsetup[number={\arabic{chapter}}]{chapter}
\CTEXsetup[nameformat={\bfseries\bf\heiti\zihao{-3}}]{chapter}
\CTEXsetup[titleformat={\bfseries\bf\heiti\zihao{-3}}]{chapter}
\CTEXsetup[beforeskip={6pt}]{chapter}
\CTEXsetup[afterskip={14pt}]{chapter}
\CTEXsetup[aftername={~}]{chapter}
\CTEXsetup[format={\noindent}]{section}
\CTEXsetup[nameformat={\bfseries\bf\heiti\zihao{4}}]{section}
\CTEXsetup[titleformat={\bfseries\bf\heiti\zihao{4}}]{section}
\CTEXsetup[beforeskip={9pt}]{section}
\CTEXsetup[afterskip={9pt}]{section}
\CTEXsetup[format={\noindent}]{subsection}
\CTEXsetup[nameformat={\heiti\bf\zihao{-4}}]{subsection}
\CTEXsetup[titleformat={\heiti\bf\zihao{-4}}]{subsection}
\CTEXsetup[beforeskip={9pt}]{subsection}
\CTEXsetup[afterskip={9pt}]{subsection}
\CTEXsetup[format={\noindent}]{subsubsection}
\CTEXsetup[nameformat={\heiti\bf\zihao{-4}}]{subsubsection}
\CTEXsetup[titleformat={\heiti\bf\zihao{-4}}]{subsubsection}
\CTEXsetup[beforeskip={9pt}]{subsubsection}
\CTEXsetup[afterskip={9pt}]{subsubsection}

% 生成目录

\newcommand\SDUcontents
{%

  \renewcommand\contentsname{\bf\heiti\zihao{-3}目\quad \quad 录}
  \tableofcontents
  }
% 修改目录的格式
\renewcommand{\cftchapfont}{\bf\songti\zihao{-4}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchappagefont}{\rm\zihao{-4}}

\renewcommand{\cftsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsecdotsep}{\cftdotsep}
\renewcommand{\cftsecpagefont}{\rm\zihao{-4}}

\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsubsecdotsep}{\cftdotsep}
\renewcommand{\cftsubsecpagefont}{\rm\zihao{-4}}

\renewcommand{\cftsubsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsubsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsubsubsecdotsep}{\cftdotsep}
\renewcommand{\cftsubsubsecpagefont}{\rm\zihao{-4}}

\setlength{\cftbeforechapskip}{-2pt}
\setlength{\cftbeforesecskip}{-2pt}

\setcounter{tocdepth}{3}

%\addtocontents{toc}{\cftpagenumbersoff{chapter}}
%
\addtocontents{toc}{\cftpagenumberson{chapter}}


% 生成英文目录
\newcommand\SDUEcontents
{
	\newcommand\engcontentsname{TABLE OF CONTENTS}
	
	\tableofengcontents
}

\newcommand\tableofengcontents
{%
    \if@twocolumn
      \@restonecoltrue/onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\engcontentsname
        \@mkboth{%
           \MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}}%
    \@starttoc{toe}% !!!!Define a new contents!!!!
    \if@restonecol\twocolumn\fi
}
\newcommand\addengabstract[2]{%
    \addcontentsline{toe}{#1}{#2}}
\newcommand\addengcontents[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}}
    \newcommand\addengcontentsChapter[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{Chapter \hskip 0.5em \relax \csname the#1\endcsname}\hskip 1.8em\relax \hskip 1.8em\relax #2}}
\newcommand\addengreference[2]{%
    \addcontentsline{toe}{#1}{#2}}
\newcommand\addengthanks[2]{%
    \addcontentsline{toe}{#1}{#2}}
\newcommand\addengpublications[2]{%
    \addcontentsline{toe}{#1}{#2}}
\newcommand\addengprojects[2]{%
    \addcontentsline{toe}{#1}{#2}}
\newcommand\addengforeignpapers[2]{%
    \addcontentsline{toe}{#1}{#2}}
\newcommand\addengappraiseanddefence[2]{%
    \addcontentsline{toe}{#1}{#2}}

\newcommand\eabstract[1]{\addengabstract{chapter}{#1}}
\newcommand\echapter[1]{\addengcontentsChapter{chapter}{#1}}
\newcommand\esection[1]{\addengcontents{section}{#1}}
\newcommand\esubsection[1]{\addengcontents{subsection}{#1}}
\newcommand\esubsubsection[1]{\addengcontents{subsubsection}{#1}}
\newcommand\ethanks[1]{\addengthanks{chapter}{#1}}
\newcommand\epublications[1]{\addengpublications{chapter}{#1}}
\newcommand\eprojects[1]{\addengprojects{chapter}{#1}}
\newcommand\eforeignpapers[1]{\addengforeignpapers{chapter}{#1}}
\newcommand\eappraiseanddefence[1]{\addengappraiseanddefence{chapter}{#1}}
\newcommand\ereference[1]{\addengreference{chapter}{#1}}

% 正文部分文字的行距设置
\linespread{1.5}

% 去掉目录中的空格字符
\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

% 致谢
\renewenvironment{thanks}
{\Nchapter{\SDU@label@thanks}}
{}

% 序言
\newenvironment{preface}
{\Nchapter{\SDU@label@preface}}
{}

% 摘要
\newenvironment{abstract}
{\Nchapter{\bf \songti\SDU@label@abstract}\pagenumbering{Roman}}
{}

%关键字
\newcommand\keywords[1]{%
\vspace{2ex}\noindent{\bf \songti \SDU@label@keywords} \songti #1}

%英文摘要
\newenvironment{englishabstract}
{\Nchapter{\SDU@label@englishabstract}}
{}

%英文关键字
\newcommand\englishkeywords[1]{%
\vspace{2ex}\noindent{\bf \SDU@label@englishkeywords} #1}

\newcommand\SDUthesisbib[1]{%
\setcitestyle{numbers, round, comma, aysep={}, yysep={,}, notesep={,}}
\setlength{\bibsep}{0.5ex}
\setlength{\bibhang}{2em}
\renewcommand{\bibfont}{\fangsong\zihao{5}}

\bibliographystyle{SDUthesis}
\bibliography{#1}
}

\makeindex

% 索引
\newcommand\SDUindex{%
\cleardoublepage
% 不用这一句会造成索引的书签位置错误
\phantomsection
\printindex
}

% 发表文章目录
\newenvironment{publications}
{\Nchapter{\SDU@label@publications}}
{}

%  攻读学位期间参与科研项目情况
\newenvironment{projects}
{\Nchapter{\SDU@label@projects}}
{}


%  学位论文评阅及答辩情况表
\newenvironment{appraiseanddefence}
{\Nchapter{\SDU@label@appraiseanddefence}}
{}

% 外文论文
\newenvironment{foreignpapers}
{\Nchapter{\SDU@label@foreignpapers}}
{}

\newcommand\makeAppraiseAndDefencePage
{
\cleardoublepage
\thispagestyle{empty}
{

\begin{center}
\bf\heiti\zihao{-3}{\SDU@label@appraiseanddefence}\\
\vspace{1cm}
\fangsong\zihao{4}	
\begin{tabular}{|c|c|c|c|c|c|c|c|}
\hline
\multirow{6}{*}{\tabincell{c}{论\\ 文\\ 评\\ 阅\\ 人}} & \multicolumn{2}{|c|}{姓\quad\quad名} & \tabincell{c}{专业技术\\职\quad\quad 务} & \tabincell{c}{是否博导\\ （硕导）} & \multicolumn{2}{|c|}{所~在~单~位} & \tabincell{c}{总体评价\\ ※}\\
 \cline{2-8}
 &  \multicolumn{2}{|c|}{} & &  & \multicolumn{2}{|c|}{} &  \\
 \cline{2-8}
 &  \multicolumn{2}{|c|}{} & &  & \multicolumn{2}{|c|}{} &  \\
 \cline{2-8}
 &  \multicolumn{2}{|c|}{} & &  & \multicolumn{2}{|c|}{} &  \\
 \cline{2-8}
 &  \multicolumn{2}{|c|}{} & &  & \multicolumn{2}{|c|}{} &  \\
 \cline{2-8}
 &  \multicolumn{2}{|c|}{} & &  & \multicolumn{2}{|c|}{} &  \\
\hline
\multirow{10}{*}{\tabincell{c}{答\\辩\\委\\员\\会\\成\\员}} &\multicolumn{2}{|c|}{姓\quad\quad名} & \tabincell{c}{专业技术\\职\quad\quad 务} & \tabincell{c}{是否博导\\ （硕导）} & \multicolumn{3}{|c|}{所~在~单~位} \\
 \cline{2-8}
 & 主席 & &  &  &  \multicolumn{3}{|c|}{}  \\
 \cline{2-8}
 & \multirow{8}{*}{\tabincell{c}{委\\  \\ \\ \\员}}& &  &  &   \multicolumn{3}{|c|}{} \\
 \cline{3-8}
 &  & &  &  &  \multicolumn{3}{|c|}{} \\
 \cline{3-8}
 &   & &  &  & \multicolumn{3}{|c|}{} \\
 \cline{3-8}
 &   & &  &  &  \multicolumn{3}{|c|}{} \\
  \cline{3-8}
 & & &  &  &   \multicolumn{3}{|c|}{} \\
 \cline{3-8}
 &  & &  &  &  \multicolumn{3}{|c|}{} \\
 \cline{3-8}
 &   & &  &  & \multicolumn{3}{|c|}{} \\
 \cline{3-8}
 &   & &  &  &  \multicolumn{3}{|c|}{} \\
\hline
\multicolumn{3}{|c|}{\tabincell{c}{答辩委员会对论\\文的总体评价※}} & & \tabincell{c}{答辩\\ 秘书} & \quad\quad\quad~\quad & \tabincell{c}{答辩\\ 日期} & \\
\hline
\multicolumn{2}{|c|}{备注} & \multicolumn{6}{|c|}{} \\
\hline
\end{tabular}

\vspace{1cm}
\fangsong\zihao{5}{※优秀为“A”；良好为“B”；合格为“C”；不合格为“D”。}
\end{center}

}
}
% 设置显示到4级标题 chapter section subsection subsubsection，可适当减小
\setcounter{secnumdepth}{4}
\newtheoremstyle{break}% name
{}%      Space above, empty = `usual value'
{}%      Space below
{\itshape}% Body font
{}%         Indent amount (empty = no indent, \parindent = para indent)
{\bfseries}% Thm head font
{.}%        Punctuation after thm head
{\newline}% Space after thm head: \newline = linebreak
{}%         Thm head spec
\endinput
%%
%% End of file `SDUthesis.cls'.
