\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prettybook}

\LoadClass[a4paper,oneside]{book}

% ----------------------------------------------------------------------
%           Pagestyle Packages
% ----------------------------------------------------------------------

\RequirePackage{geometry,lscape}

% ----------------------------------------------------------------------
%           Font Packages
% ----------------------------------------------------------------------

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern,mathrsfs}

% ----------------------------------------------------------------------
%           Color Packages
% ----------------------------------------------------------------------

\RequirePackage[dvipsnames]{xcolor}
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{main}{RGB}{0,166,82}
\definecolor{second}{RGB}{255,134,24}
\definecolor{third}{RGB}{0,174,247}

% ----------------------------------------------------------------------
%           References Packages
% ----------------------------------------------------------------------

\RequirePackage{hyperref}
\hypersetup{
  breaklinks,
  unicode,
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  colorlinks,
  linkcolor=winered,
  citecolor=winered,
  urlcolor=winered,
  plainpages=false,
  pdfstartview=FitH,
  pdfborder={0 0 0},
  linktocpage
}
\RequirePackage{biblatex}

% ----------------------------------------------------------------------
%           Text Packages
% ----------------------------------------------------------------------

\RequirePackage{enumerate}
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}

% ----------------------------------------------------------------------
%           Math Packages
% ----------------------------------------------------------------------

\RequirePackage{amsmath,amssymb,amsfonts,mathtools,bm}

% ----------------------------------------------------------------------
%           Table & Figure Packages
% ----------------------------------------------------------------------

\RequirePackage{booktabs,tabularx,multirow,multicol}
\RequirePackage{graphicx}
\RequirePackage{float,caption,subcaption}

\captionsetup{labelfont={bf}}
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% ----------------------------------------------------------------------
%           Additional Enviroments Packages
% ----------------------------------------------------------------------

\RequirePackage{marginnote,sidenotes}
\RequirePackage[ruled,vlined,linesnumbered,noresetcount]{algorithm2e}

% ----------------------------------------------------------------------
%           Specific Environments
% ----------------------------------------------------------------------

\RequirePackage{amsthm}
\theoremstyle{definition}{
  \newtheorem*{property}{Property}
  \newtheorem*{example}{Example}
  \newtheorem*{exercise}{Exercise}
}
\theoremstyle{remark}{
  \newtheorem*{remark}{Remark}
}

\RequirePackage[many]{tcolorbox}
\newcommand{\definitionname}{Definition}
\newcommand{\theoremname}{Theorem}
\newcommand{\lemmaname}{Lemma}
\newcommand{\propositionname}{Proposition}
\newcommand{\corollaryname}{Corollary}

\tcbset{
  common/.style={
    lower separated=false,
    coltitle=white,
    colback=gray!5,
    boxrule=0.5pt,
    fonttitle=\bfseries,
    enhanced,
    top=8pt,
    before skip=8pt,
    attach boxed title to top left={
      yshift=-0.11in,
      xshift=0.15in
    },
    boxed title style={
      boxrule=0pt,
      colframe=white,
      arc=0pt,
      outer arc=0pt
    },
    separator sign={.},
  },
  defstyle/.style={
    common,
    colframe=main,
    colback=main!5,
    colbacktitle=main,
  },
  thmstyle/.style={
    common,
    colframe=second,
    colback=second!5,
    colbacktitle=second,
  },
  propstyle/.style={
    common,
    colframe=third,
    colback=third!5,
    colbacktitle=third,
  },
}
\DeclareTColorBox[auto counter,number within=section]{definition}{ o t\label g }{
  common,defstyle,
  IfValueTF={#1}{title={\definitionname~\thetcbcounter\ (#1)}}{title=\definitionname~\thetcbcounter},
  IfBooleanTF={#2}{label=#3}{}
}
\DeclareTColorBox[auto counter,number within=section]{theorem}{ o t\label g }{
  common,thmstyle,
  IfValueTF={#1}{title={\theoremname~\thetcbcounter\ (#1)}}{title=\theoremname~\thetcbcounter},
  IfBooleanTF={#2}{label=#3}{}
}
\DeclareTColorBox[auto counter,number within=section]{corollary}{ o t\label g }{
  common,thmstyle,
  IfValueTF={#1}{title={\corollaryname~\thetcbcounter\ (#1)}}{title=\corollaryname~\thetcbcounter},
  IfBooleanTF={#2}{label=#3}{}
}
\DeclareTColorBox[auto counter,number within=section]{lemma}{ o t\label g }{
  common,thmstyle,
  IfValueTF={#1}{title={\lemmaname~\thetcbcounter\ (#1)}}{title=\lemmaname~\thetcbcounter},
  IfBooleanTF={#2}{label=#3}{}
}
\DeclareTColorBox[auto counter,number within=section]{proposition}{ o t\label g }{
  common,propstyle,
  IfValueTF={#1}{title={\propositionname~\thetcbcounter\ (#1)}}{title=\propositionname~\thetcbcounter},
  IfBooleanTF={#2}{label=#3}{}
}
