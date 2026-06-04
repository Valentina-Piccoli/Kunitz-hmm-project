%%
%% This is file `cdrart.cls', Version 1.7
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from cdrart.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file cdrart.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cdrart}
[2025/09/26 v2.16 Typesetting articles for the Cyber Defense Review]
\def\@classname{cdrart}
\InputIfFileExists{cdrart-preload-hook.tex}{%
  \ClassWarning{\@classname}{%
    I am loading cdrart-preload-hook.tex. You are fully responsible
    for any problems from now on.}}{}
\RequirePackage{xkeyval}
\RequirePackage{xstring}
\RequirePackage{iftex}
\define@choicekey*+{\@classname.cls}{format}[\CDR@format\CDR@format@nr]{%
  cdrreview, cdrprint}[cdrreview]{}{%
  \ClassError{\@classname}{The option format must be cdrreview or cdrprint}}
\def\@DeclareCDRFormat#1{\DeclareOptionX{#1}{\setkeys{\@classname.cls}{format=#1}}}
\@DeclareCDRFormat{cdrreview}
\@DeclareCDRFormat{cdrprint}
\ExecuteOptionsX{format}
\define@boolkey+{\@classname.cls}[@CDR@]{screen}[true]{%
  \if@CDR@screen
    \PackageInfo{\@classname}{Using screen mode}%
  \else
    \PackageInfo{\@classname}{Not using screen mode}%
  \fi}{\PackageError{\@classname}{The option screen can be either true or
    false}}
\ExecuteOptionsX{screen=false}
\define@boolkey+{\@classname.cls}[@CDR@]{urlbreakonhyphens}[true]{%
  \if@CDR@urlbreakonhyphens
    \PackageInfo{\@classname}{Using breaking urls on hyphens}%
  \else
    \PackageInfo{\@classname}{Not breaking urls on hyphens}%
  \fi}{\PackageError{\@classname}{The option urlbreakonhyphens can be either true or
    false}}
\ExecuteOptionsX{urlbreakonhyphens=true}
\define@boolkey+{\@classname.cls}[@CDR@]{cdrthm}[true]{%
  \if@CDR@cdrthm
    \PackageInfo{\@classname}{Requiring cdrthm}%
  \else
    \PackageInfo{\@classname}{Suppressing cdrthm}%
  \fi}{\PackageError{\@classname}{The option cdrthm can be either true or
    false}}
\ExecuteOptionsX{cdrthm=true}
\define@boolkey+{\@classname.cls}[@CDR@]{review}[true]{%
  \if@CDR@review
    \PackageInfo{\@classname}{Using review mode}%
    \AtBeginDocument{\@CDR@printfoliostrue}%
  \else
    \PackageInfo{\@classname}{Not using review mode}%
  \fi}{\PackageError{\@classname}{The option review can be either true or
    false}}
\ExecuteOptionsX{review=false}
\define@boolkey+{\@classname.cls}[@CDR@]{inpress}[true]{%
  \if@CDR@inpress
    \PackageInfo{\@classname}{Using inpress mode}%
  \else
    \PackageInfo{\@classname}{Not using inpress mode}%
  \fi}{\PackageError{\@classname}{The option inpress can be either true or
    false}}
\ExecuteOptionsX{inpress=false}
\define@boolkey+{\@classname.cls}[@CDR@]{showauthorimage}[false]{%
  \if@CDR@showauthorimage
    \PackageInfo{\@classname}{Using showauthorimage mode}%
  \else
    \PackageInfo{\@classname}{Not using showauthorimage mode}%
  \fi}{\PackageError{\@classname}{The option showauthorimage can be either true or
    false}}
\ExecuteOptionsX{showauthorimage=false}
\define@boolkey+{\@classname.cls}[@CDR@]{balance}[true]{}{%
  \PackageError{\@classname}{The option balance can be either true or
    false}}
\ExecuteOptionsX{balance}
\define@boolkey+{\@classname.cls}[@CDR@]{pbalance}[true]{}{%
  \PackageError{\@classname}{The option pbalance can be either true or
    false}}
\ExecuteOptionsX{pbalance=false}
\define@boolkey+{\@classname.cls}[@CDR@]{anonymous}[true]{%
  \if@CDR@anonymous
    \PackageInfo{\@classname}{Using anonymous mode}%
  \else
    \PackageInfo{\@classname}{Not using anonymous mode}%
  \fi}{\PackageError{\@classname}{The option anonymous can be either true or
    false}}
\ExecuteOptionsX{anonymous=false}
\define@boolkey+{\@classname.cls}[@CDR@]{timestamp}[true]{%
  \if@CDR@timestamp
    \PackageInfo{\@classname}{Using timestamp mode}%
  \else
    \PackageInfo{\@classname}{Not using timestamp mode}%
  \fi}{\PackageError{\@classname}{The option timestamp can be either true or
    false}}
\ExecuteOptionsX{timestamp=false}
\define@boolkey+{\@classname.cls}[@CDR@]{authordraft}[true]{%
  \if@CDR@authordraft
    \PackageInfo{\@classname}{Using authordraft mode}%
    %\@CDR@timestamptrue
    \@CDR@reviewtrue
  \else
    \PackageInfo{\@classname}{Not using authordraft mode}%
  \fi}{\PackageError{\@classname}{The option authordraft can be either true or
    false}}
\ExecuteOptionsX{authordraft=false}
\def\CDR@fontsize{}
\DeclareOptionX{8pt}{\edef\CDR@fontsize{\CurrentOption}}
\DeclareOptionX{9pt}{\edef\CDR@fontsize{\CurrentOption}}
\DeclareOptionX{10pt}{\edef\CDR@fontsize{\CurrentOption}}
\DeclareOptionX{11pt}{\edef\CDR@fontsize{\CurrentOption}}
\DeclareOptionX{12pt}{\edef\CDR@fontsize{\CurrentOption}}
\def\CDR@languages{}
\DeclareOptionX{language}{%
  \ifx\CDR@languages\@empty
  \gdef\CDR@languages{english}\fi
  \g@addto@macro\CDR@languages{, #1}}
\DeclareOptionX{draft}{\PassOptionsToClass{\CurrentOption}{amsart}}
\DeclareOptionX{*}{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptionsX
\ClassInfo{\@classname}{Using format \CDR@format, number \CDR@format@nr}
\newif\if@CDR@cdrreview
\newif\if@CDR@journal
\newif\if@CDR@journal@bibstrip
\newif\if@CDR@engage
\@CDR@engagefalse
\newif\if@CDR@cdrcp
\@CDR@cdrcpfalse
\ifnum\CDR@format@nr=0\relax
  \@CDR@cdrreviewtrue
\else
  \@CDR@cdrreviewfalse
\fi
\ifcase\CDR@format@nr
\relax % cdrreview
  \@CDR@journaltrue
\or % cdrprint
  \@CDR@journaltrue
\fi
\if@CDR@journal
  \@CDR@journal@bibstriptrue
\else
 \@CDR@journal@bibstripfalse
\fi
\ifx\CDR@fontsize\@empty
  \ifcase\CDR@format@nr
  \relax % cdrreview
    \def\CDR@fontsize{11pt}%
  \or % cdrprint
    \def\CDR@fontsize{11pt}%    
  \fi
\fi
\ClassInfo{\@classname}{Using fontsize \CDR@fontsize}
\LoadClass[\CDR@fontsize, reqno]{amsart}
\RequirePackage{microtype}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{refcount}
\RequirePackage{totpages}
\RequirePackage{environ}
\RequirePackage{lipsum}
\RequirePackage{setspace}
\singlespacing
\newdimen\@CDR@cdrcp@delta
\@CDR@cdrcp@delta=0pt\relax
\if@CDR@journal
  \renewcommand\keywordsname{\textbf{Keywords}}% Here is the keywords title
\else
  \renewcommand\keywordsname{Keywords}%
\fi
\if@CDR@engage
   \renewcommand\abstractname{Synopsis}%
\fi
\ifx\CDR@languages\@empty
\else
  \RequirePackage[\CDR@languages]{babel}%
  \addto\captionsenglish{%
      \if@CDR@journal
        \renewcommand\keywordsname{Keywords}%
      \else
        \renewcommand\keywordsname{Keywords}%
      \fi
      \renewcommand\acksname{Acknowledgements}%
      \if@CDR@engage
         \renewcommand\abstractname{Synopsis}%
      \fi
  }%
  \addto\captionsfrench{%
      \if@CDR@journal
        \renewcommand\keywordsname{Mots Clés et Phrases Supplémentaires}%
      \else
        \renewcommand\keywordsname{Mots clés}%
      \fi
      \renewcommand\acksname{Remerciements}%
  }%
  \addto\captionsgerman{%
      \if@CDR@journal
        \renewcommand\keywordsname{Zusätzliche Schlagwörter und Phrasen}%
      \else
        \renewcommand\keywordsname{Schlagwörter}%
      \fi
      \renewcommand\acksname{Danksagungen}%
  }%
  \addto\captionsspanish{%
      \if@CDR@journal
        \renewcommand\keywordsname{Palabras y Frases Claves Adicionales}%
      \else
        \renewcommand\keywordsname{Palabras claves}%
      \fi
      \renewcommand\acksname{Expresiones de gratitud}%
  }%
\fi
\newcommand\CDR@lang@check[1]{%
  \ifx\CDR@languages\@empty\relax
  \ClassError{\@classname}{%
    Command \string#1 \MessageBreak is used in monlingual document}{%
    You used a command (\string#1) \MessageBreak
    that does not have a meaning \MessageBreak
    unless are languages are defined. \MessageBreak
    Please choose the languages in \string\documentclass
    \MessageBreak
    (e.g. \string\documentclass[languages={french, english}]{cdrart}),
    \MessageBreak
    or delete the command.}%
  \fi}
\def\@translatedtitle{}
\newcommand\translatedtitle[2]{\CDR@lang@check{\translatedtitle}%
\g@addto@macro\@translatedtitle{\par\foreignlanguage{#1}{#2}}}
\def\@translatedsubtitle{}
\newcommand\translatedsubtitle[2]{\CDR@lang@check{\translatedsubtitle}%
\g@addto@macro\@translatedsubtitle{\par\foreignlanguage{#1}{#2}}}
\def\@translatedkeywords{}
\newcommand\translatedkeywords[2]{\CDR@lang@check{\translatedkeywords}%
\g@addto@macro\@translatedkeywords{\@mktranslatedkeywords{#1}{#2}}}
\def\@translatedabstracts{}
\newenvironment{translatedabstract}[1]{\Collect@Body
  \@savetranslatedabstract\@mktranslatedabstract{#1}}{}
\long\def\@savetranslatedabstract#1{\if@CDR@maketitle@typeset
  \ClassError{\@classname}{Abstract must be defined before maketitle
    command. Please move it!}\fi
  \CDR@lang@check{translatedabstract}%
  \g@addto@macro\@translatedabstracts{\bgroup#1\egroup}}
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \edef\@toclevel{\ifnum#2=\@m 0\else\number#2\fi}%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \ifnum #2>\c@secnumdepth \else
        \@tochangmeasure{\csname the#1\endcsname}%
    \fi
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \ifnum #2>\c@secnumdepth \else
        \@tochangmeasure{\csname the#1\endcsname\space}%
      \fi
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}
\def\@seccntformat#1{\csname the#1\endcsname\quad}
\def\@starttoc#1#2{\begingroup\makeatletter
  \setTrue{#1}%
  \par\removelastskip\vskip\z@skip
  \@startsection{section}\@M\z@{\linespacing\@plus\linespacing}%
    {.5\linespacing}{\centering\contentsnamefont}{#2}%
  \@input{\jobname.#1}%
  \if@filesw
    \@xp\newwrite\csname tf@#1\endcsname
    \immediate\@xp\openout\csname tf@#1\endcsname \jobname.#1\relax
  \fi
  \global\@nobreakfalse \endgroup
  \addvspace{32\p@\@plus14\p@}%
}
\def\l@section{\@tocline{1}{0pt}{1pc}{2pc}{}}
\def\l@subsection{\@tocline{2}{0pt}{1pc}{3pc}{}}
\def\l@subsubsection{\@tocline{3}{0pt}{1pc}{5pc}{}}
\def\@makefntext{\noindent\@makefnmark}
\long\def\@mpfootnotetext#1{%
  \global\setbox\@mpfootins\vbox{%
    \unvbox\@mpfootins
    \reset@font\footnotesize
    \hsize\columnwidth
    \@parboxrestore
    \protected@edef\@currentlabel
         {\csname p@mpfootnote\endcsname\@thefnmark}%
    \color@begingroup\centering
      \@makefntext{%
        \rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}%
    \color@endgroup}}
\def\@makefnmark{\hbox{\@textsuperscript{\@thefnmark}}}
\let\@footnotemark@nolink\@footnotemark
\let\@footnotetext@nolink\@footnotetext
%\RequirePackage[bookmarksnumbered,unicode]{hyperref}
\PassOptionsToPackage{hyphens}{url}\RequirePackage[bookmarksnumbered,unicode]{hyperref}
\RequirePackage{hyperxmp}
\pdfstringdefDisableCommands{%
  \def\addtocounter#1#2{}%
  \def\unskip{}%
  \def\textbullet{- }%
  \def\textrightarrow{ -> }%
  \def\footnotemark{}%
}
\urlstyle{rm} % Here is the url style
\ifcase\CDR@format@nr
\relax % cdrreview
\or % cdrprint
\fi
\AtEndPreamble{%
  \if@CDR@urlbreakonhyphens
    \def\do@url@hyp{\do\-}%
  \fi
  \if@CDR@screen
    \hypersetup{colorlinks,
      linkcolor=CDRPurple,
      citecolor=CDRPurple,
      urlcolor=CDRDarkBlue,
      filecolor=CDRDarkBlue}
    \else
    \hypersetup{hidelinks}
  \fi
  \hypersetup{pdflang={en},
    pdfdisplaydoctitle}}
\RequirePackage{graphicx}
\RequirePackage[prologue]{xcolor}
\definecolor[named]{CDRBlue}{cmyk}{1,0.1,0,0.1}
\definecolor[named]{CDRYellow}{cmyk}{0,0.16,1,0}
\definecolor[named]{CDROrange}{cmyk}{0,0.42,1,0.01}
\definecolor[named]{CDRRed}{cmyk}{0,0.90,0.86,0}
\definecolor[named]{CDRLightBlue}{cmyk}{0.49,0.01,0,0}
\definecolor[named]{CDRGreen}{cmyk}{0.20,0,1,0.19}
\definecolor[named]{CDRPurple}{cmyk}{0.55,1,0,0.15}
\definecolor[named]{CDRDarkBlue}{cmyk}{1,0.58,0,0.21}
\if@CDR@authordraft
  \RequirePackage{draftwatermark}
  \SetWatermarkFontSize{0.5in}
  \SetWatermarkColor[gray]{.9}
  \SetWatermarkText{\parbox{12em}{\centering
      Unpublished draft.\\
      Not for distribution.}}
\fi
\RequirePackage{geometry}
\ifcase\CDR@format@nr % Here is the page geometry
\relax % cdrreview
   \geometry{twoside=true, head=13pt, foot=3pc,
     paperwidth=7in, paperheight=10in,
     includeheadfoot,
     top=.75in, bottom=.75in, inner=.75in, outer=.75in,
     marginparwidth=2pc,heightrounded
     }%
\or % cdrprint
   \geometry{twoside=true, head=13pt, foot=3pc,
     paperwidth=7in, paperheight=10in,
     includeheadfoot,
     top=.75in, bottom=.75in, inner=.75in, outer=.75in,
     marginparwidth=2pc,heightrounded
     }%
\fi
\setlength\parindent{10\p@}
\setlength\parskip{\z@}
\ifcase\CDR@format@nr % Here is the paragraph formatting
\relax % cdrreview
 \setlength\parskip{.0625in}
\or % cdrprint
 \setlength\parskip{.0625in}
\fi
\setlength\normalparindent{\parindent}
\def\copyrightpermissionfootnoterule{{\color{lightgray}\kern-3\p@
  \hrule \@width \columnwidth \kern 2.6\p@}}
\RequirePackage{manyfoot}
\SelectFootnoteRule[2]{copyrightpermission}
\DeclareNewFootnote{authorsaddresses}
\SelectFootnoteRule[2]{copyrightpermission}
\DeclareNewFootnote{copyrightpermission}
\DeclareNewFootnote{A}[symbol]
\def\Bfootnoterule{{\color{lightgray}\kern-3\p@
  \hrule \@width \columnwidth \kern 2.6\p@}}
\DeclareNewFootnote{B}[arabic]
\def\footnoterule{{\color{lightgray}\kern-3\p@
  \hrule \@width .6\columnwidth \kern 2.6\p@}}
\def\endminipage{%
    \par
    \unskip
    \ifvoid\@mpfootins\else
      \vskip\skip\@mpfootins
      \normalcolor
      \unvbox\@mpfootins
    \fi
    \@minipagefalse
  \color@endgroup
  \egroup
  \expandafter\@iiiparbox\@mpargs{\unvbox\@tempboxa}}
\def\@textbottom{\vskip \z@ \@plus 1pt}
\let\@texttop\relax
\ifcase\CDR@format@nr
\relax % cdrreview
\or % cdrprint
\fi
\ifPDFTeX
\input{glyphtounicode}
\pdfglyphtounicode{f_f}{FB00}
\pdfglyphtounicode{f_f_i}{FB03}
\pdfglyphtounicode{f_f_l}{FB04}
\pdfglyphtounicode{f_i}{FB01}
\pdfglyphtounicode{t_t}{0074 0074}
\pdfglyphtounicode{f_t}{0066 0074}
\pdfglyphtounicode{T_h}{0054 0068}
\pdfgentounicode=1
\RequirePackage{cmap}
\fi
\newif\if@CDR@newfonts
\@CDR@newfontstrue
\IfFileExists{libertine.sty}{}{\ClassWarning{\@classname}{You do not
    have the libertine package installed.  Please upgrade your
    TeX}\@CDR@newfontsfalse}
\IfFileExists{zi4.sty}{}{\ClassWarning{\@classname}{You do not
    have the inconsolata (zi4.sty) package installed.  Please upgrade your
    TeX}\@CDR@newfontsfalse}
\IfFileExists{newtxmath.sty}{}{\ClassWarning{\@classname}{You do not
    have the newtxmath package installed.  Please upgrade your
    TeX}\@CDR@newfontsfalse}
\if@CDR@newfonts % Here is the font noto
  \ifxetex
       \RequirePackage[T1]{fontenc}
       \RequirePackage{noto}
  \else
    \ifluatex
       \RequirePackage[T1]{fontenc}
       \RequirePackage{noto}
    \else
       \RequirePackage[T1]{fontenc}
       \RequirePackage{noto}
       \RequirePackage[noto]{newtxmath}
       \RequirePackage{anyfontsize}
        \DeclareRobustCommand{\ebseries}{\fontseries{eb}\selectfont}
        \DeclareTextFontCommand{\texteb}{\ebseries}

        \DeclareRobustCommand{\sbseries}{\fontseries{sb}\selectfont}
        \DeclareTextFontCommand{\textsb}{\sbseries}

        \DeclareRobustCommand{\elseries}{\fontseries{el}\selectfont}
        \DeclareTextFontCommand{\textel}{\elseries}

        \DeclareRobustCommand{\lseries}{\fontseries{l}\selectfont}
        \DeclareTextFontCommand{\textl}{\lseries}

        \DeclareRobustCommand{\ulseries}{\fontseries{ul}\selectfont}
        \DeclareTextFontCommand{\textul}{\ulseries}

        \renewcommand{\textbf}[1]{{\sbseries#1}}        
    \fi
  \fi
\fi
\let\liningnums\@undefined
\AtEndPreamble{%
  \DeclareTextFontCommand{\liningnums}{\libertineLF}}
\newif\if@Description@present
\@Description@presenttrue
\newif\if@undescribed@images
\@undescribed@imagesfalse
\newcommand\Description[2][]{\global\@Description@presenttrue\ignorespaces}
\AtEndDocument{\if@undescribed@images
  \ClassWarningNoLine{\@classname}{Some images may lack
    descriptions.\MessageBreak
  CDR is committed to complying with the upcoming US ADA
  https://accessiblyapp.com/accessibility-compliance/ada/ and European
  Accessibility Act
  (EAA) https://accessiblyapp.com/accessibility-compliance/eaa/
  regulations by actively working to ensure our publications and
  application services are accessible to individuals with
  disabilities, adhering to the WCAG guidelines to provide a seamless
  experience for all users, and regularly reviewing our accessibility
  practices to maintain compliance with evolving standards. \MessageBreak
  To this end, we strongly encourage our authors to provide
  alternative text and captions for images and multimedia content. It
  is also important to optimize color contrast for the visually
  impaired. Taking these important steps when creating your papers
  will ensure that the widest possible audience can ingest your
  work.}\fi}
\AtBeginEnvironment{figure}{\@Description@presentfalse
  \let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{figure*}{\@Description@presentfalse
  \let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtEndEnvironment{figure}{\if@Description@present\else
  \global\@undescribed@imagestrue
  \ClassWarning{\@classname}{A possible image without description}\fi}
\AtEndEnvironment{figure*}{\if@Description@present\else
  \global\@undescribed@imagestrue
  \ClassWarning{\@classname}{A possible image without description}\fi}
\AtBeginEnvironment{table}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{table*}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{algorithm}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{algorithm*}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{lstlisting}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{lstlisting*}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{minted}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{minted*}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{listing}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{listing*}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{lstinputlisting}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}
\AtBeginEnvironment{lstinputlisting*}{\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig}

\RequirePackage{caption, float}
\captionsetup[table]{position=bottom} % Here is the table options
\if@CDR@journal
  \captionsetup{labelfont={sf, scriptsize},
    textfont={sf, scriptsize}, margin=\z@}
  \captionsetup[figure]{name={Figure}}
  \setlength{\heavyrulewidth}{0.5pt}
  \setlength{\abovecaptionskip}{6pt} % Space above the caption
  \setlength{\belowcaptionskip}{6pt} % Space below the caption
  \setlength{\textfloatsep}{6pt}
\else
  \captionsetup{labelfont={bf},
    textfont={bf}, labelsep=colon, margin=\z@}
  \ifcase\CDR@format@nr
  \relax % cdrreview
  \or % cdrprint
  \fi
\fi
\newcommand{\CDRtabbookmark}[3][]{%
  \begingroup
    % Default level = 2 if the optional arg is empty
    \edef\CDR@level{\if\relax\detokenize{#1}\relax 2\else #1\fi}%
    \pdfbookmark[\CDR@level]{Table~\ref{#3}: #2}{#3}%
  \endgroup
}
\newcommand{\CDRfigbookmark}[3][]{%
  \begingroup
    % Default level = 2 if the optional arg is empty
    \edef\CDR@level{\if\relax\detokenize{#1}\relax 2\else #1\fi}%
    \pdfbookmark[\CDR@level]{Fig.~\ref{#3}: #2}{#3}%
  \endgroup
}
\newfloat{sidebar}{}{sbar}
\floatname{sidebar}{Sidebar}
\renewenvironment{sidebar}{\Collect@Body\@sidebar}{}
\long\def\@sidebar#1{\bgroup\let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig\captionsetup{type=sidebar}%
  \marginpar{\small#1}\egroup}
\newenvironment{marginfigure}{\Collect@Body\@marginfigure}{}
\long\def\@marginfigure#1{\bgroup
  \let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig
  \captionsetup{type=figure}%
  \marginpar{\@Description@presentfalse\centering
    \small#1\if@Description@present\else
      \global\@undescribed@imagestrue
      \ClassWarning{\@classname}{A possible image without description}
      \fi}%
  \egroup}
\newenvironment{margintable}{\Collect@Body\@margintable}{}
\long\def\@margintable#1{
  \bgroup
    \let\@vspace\@vspace@orig
    \let\@vspacer\@vspacer@orig
    \captionsetup{type=table}%
    \marginpar{\centering\small#1}
  \egroup}
\newdimen\fulltextwidth
\fulltextwidth=\dimexpr(\textwidth+\marginparwidth+\marginparsep)
\def\@endwidefloatbox{%
  \par\vskip\z@skip
  \@minipagefalse
  \outer@nobreak
  \egroup
  \color@endbox
  \global\setbox\@currbox=\vbox{\moveleft
    \dimexpr(\fulltextwidth-\textwidth)\box\@currbox}%
  \wd\@currbox=\textwidth
}
\ifcase\CDR@format@nr
\relax % cdrreview
\or % cdrprint
\fi
\newdimen\@CDR@labelwidth
\AtBeginDocument{%
  \setlength\labelsep{4pt}
  \setlength{\@CDR@labelwidth}{6.5pt}

  %% First-level list: when beginning after the first line of an
  %% indented paragraph or ending before an indented paragraph, labels
  %% should not hang to the left of the preceding/following text.
  \setlength\leftmargini{\z@}
  % \addtolength\leftmargini{\parindent}
  % \addtolength\leftmargini{\labelsep}
  % \addtolength\leftmargini{\@CDR@labelwidth}

  %% Second-level and higher lists.
  \setlength\leftmarginii{\z@}
  \addtolength\leftmarginii{0.5\labelsep}
  \addtolength\leftmarginii{\@CDR@labelwidth}
  \setlength\leftmarginiii{\leftmarginii}
  \setlength\leftmarginiv{\leftmarginiii}
  \setlength\leftmarginv{\leftmarginiv}
  \setlength\leftmarginvi{\leftmarginv}
  \@listi}
\newskip\listisep
\listisep\z@
\def\@listI{\leftmargin2em
  \labelwidth\leftmargini \advance\labelwidth-\labelsep
  \listparindent\z@
  \topsep\listisep}
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii \advance\labelwidth-\labelsep
  \topsep\z@skip}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii \advance\labelwidth-\labelsep}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}
\renewcommand{\descriptionlabel}[1]{\upshape\bfseries #1}
\renewenvironment{description}{\list{}{%
    \labelwidth\@CDR@labelwidth
    \let\makelabel\descriptionlabel}%
}{
  \endlist
}
\let\enddescription=\endlist % for efficiency

\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
  {
   \begin{list}{}{
       \setlength{\leftmargin}{0.25in}
       \setlength{\rightmargin}{0.25in}
       \setlength{\topsep}{-10pt}        % Remove space above and below
       \setlength{\parsep}{0pt}        % Remove extra space between paragraphs
       \setlength{\partopsep}{0pt}     % Remove extra top space in some contexts
       \setlength{\itemindent}{0pt}    % No item indentation
       \setlength{\listparindent}{0pt} % No paragraph indentation inside
     }
     \begin{spacing}{1}
     \footnotesize\lseries
     \item\relax
     \noindent\ignorespaces
     \oldquote
     } % Prevent indentation on first line
  {\endoldquote
   \end{spacing}
   \end{list}
   }
   
\newif\if@CDR@maketitle@typeset
\@CDR@maketitle@typesetfalse
\define@choicekey*+{CDR}{cdrJournal}[\@journalCode\@journalCode@nr]{%
  CDRJCSS,%
  CDR%
}{%
\ifcase\@journalCode@nr
\relax % CDRJCSS
  \def\@journalName{CDR Journal on Computing and Sustainable Societies}%
  \def\@journalNameShort{CDR J. Comput. Sustain. Soc.}%
  \def\@permissionCodeOne{2834-5533}%
  \def\@permissionCodeTwo{2834-5533}%
\or % CDR
  \def\@journalName{The Cyber Defense Review}%
  \def\@journalNameShort{Cyber Defense Rev.}%
  \def\@permissionCodeOne{ }%
  \def\@permissionCodeTwo{ }%
\fi
\ClassInfo{\@classname}{Using journal code \@journalCode}%
}{%
  \ClassError{\@classname}{Incorrect journal #1}%
}%
\def\cdrJournal#1{\setkeys{CDR}{cdrJournal=#1}%
  \global\@CDR@journal@bibstriptrue}
\def\@journalCode@nr{0}
\def\@journalName{}%
\def\@journalNameShort{\@journalName}%
\def\@permissionCodeOne{XXXX-XXXX}%
\def\@permissionCodeTwo{\@permissionCodeOne}%
\newcommand\cdrConference[4][]{%
  \gdef\cdrConference@shortname{#1}%
  \gdef\cdrConference@name{#2}%
  \gdef\cdrConference@date{#3}%
  \gdef\cdrConference@venue{#4}%
  \ifx\cdrConference@shortname\@empty
    \gdef\cdrConference@shortname{#2}%
  \fi
  \global\@CDR@journal@bibstripfalse
  \ifx\@cdrBooktitle\@empty\relax
    \cdrBooktitle{Proceedings of \cdrConference@name
      \ifx\cdrConference@name\cdrConference@shortname\else
      \ (\cdrConference@shortname)\fi}%
  \fi
}
\if@CDR@journal\else
\cdrConference[Conference'17]{CDR Conference}{July 2017}{Washington,
  DC, USA}%
\fi
\def\cdrBooktitle#1{\gdef\@cdrBooktitle{#1}}
\cdrBooktitle{}
\def\@editorsAbbrev{(Ed.)}
\def\@cdrEditors{}
\def\editor#1{\ifx\@cdrEditors\@empty
    \gdef\@cdrEditors{#1}%
  \else
    \gdef\@editorsAbbrev{(Eds.)}%
    \g@addto@macro\@cdrEditors{\and#1}%
\fi}
\def\subtitle#1{\def\@subtitle{#1}}
\subtitle{}
\newcount\num@authorgroups
\num@authorgroups=0\relax
\newcount\num@authors
\num@authors=0\relax
\newif\if@insideauthorgroup
\@insideauthorgroupfalse
\renewcommand\author[2][]{%
  \IfSubStr{\detokenize{#2}}{,}{\ClassWarning{\@classname}{Do not put several
      authors in the same \string\author\space macro!}}{}%
  \global\advance\num@authors by 1\relax
  \if@insideauthorgroup\else
    \global\advance\num@authorgroups by 1\relax
    \global\@insideauthorgrouptrue
  \fi
  \ifx\addresses\@empty
    \if@CDR@anonymous
      \gdef\addresses{\@author{Anonymous Author(s)%
        \ifx\@cdrSubmissionID\@empty\else\\Submission Id:
          \@cdrSubmissionID\fi}}%
      \gdef\authors{Anonymous Author(s)}%
    \else
      \expandafter\gdef\expandafter\addresses\expandafter{%
        \expandafter\@author\expandafter{%
          \csname typeset@author\the\num@authors\endcsname{#2}}}%
      \gdef\authors{#2}%
    \fi
  \else
    \if@CDR@anonymous\else
    \expandafter\g@addto@macro\expandafter\addresses\expandafter{%
      \expandafter\and\expandafter\@author\expandafter{%
        \csname typeset@author\the\num@authors\endcsname{#2}}}%
      \g@addto@macro\authors{\and#2}%
    \fi
  \fi
  \if@CDR@anonymous
    \ifx\shortauthors\@empty
      \gdef\shortauthors{Anon.
        \ifx\@cdrSubmissionID\@empty\else Submission Id:
        \@cdrSubmissionID\fi}%
    \fi
  \else
    \def\@tempa{#1}%
    \ifx\@tempa\@empty
      \ifx\shortauthors\@empty
        \gdef\shortauthors{#2}%
      \else
        \g@addto@macro\shortauthors{\and#2}%
      \fi
    \else
      \ifx\shortauthors\@empty
        \gdef\shortauthors{#1}%
      \else
        \g@addto@macro\shortauthors{\and#1}%
      \fi
    \fi
  \fi}
\newcommand{\affiliation}[2][]{%
  \global\@insideauthorgroupfalse
  \if@CDR@anonymous\else
    \g@addto@macro\addresses{\affiliation{#1}{#2}}%
  \fi}
\define@boolkey+{@CDR@affiliation@}[@CDR@affiliation@]{obeypunctuation}%
[true]{}{\ClassError{\@classname}{The option obeypunctuation can be either true or false}}
\def\additionalaffiliation#1{\authornote{\@additionalaffiliation{#1}}}
\def\@additionalaffiliation#1{\bgroup
  \def\position##1{\ignorespaces}%
  \def\institution##1{##1\ignorespaces}%
  \def\department{\@ifnextchar[{\@department}{\@department[]}}%
  \def\@department[##1]##2{##2, \ignorespaces}%
  \let\city\position
  \let\state\position
  \let\country\position
  Also with #1\unskip.\egroup}
\renewcommand{\email}[2][]{%
  \IfSubStr{#2}{,}{\ClassWarning{\@classname}{Do not put several
      addresses in the same \string\email\space macro!}}{}%
  \if@CDR@anonymous\else
    \g@addto@macro\addresses{\email{#1}{#2}}%
  \fi}
\def\orcid#1{\unskip\ignorespaces%
  \protected\def\orcidsite{https://orcid.org/}%
  \IfBeginWith{#1}{http}{%
    \expandafter\gdef\csname
        typeset@author\the\num@authors\endcsname##1{%
          \href{#1}{##1}}}{%
    \expandafter\gdef\csname
        typeset@author\the\num@authors\endcsname##1{%
          \href{\orcidsite#1}{##1}}}}
\def\authorsaddresses#1{\def\@authorsaddresses{#1}}
\authorsaddresses{\@mkauthorsaddresses}
\newcommand\@mktranslatedkeywords[2]{\bgroup
  \selectlanguage{#1}%
  {\@specialsection{\keywordsname}%
    \noindent#2\par}\egroup}
\def\@titlenotes{}
\def\titlenote#1{%
  \g@addto@macro\@title{\footnotemark}%
  \if@CDR@anonymous
    \g@addto@macro\@titlenotes{%
      \stepcounter{footnote}\footnotetext{Title note}}%
  \else
    \g@addto@macro\@titlenotes{%\
        \renewcommand\@makefntext[1]{%
        \setlength\parindent{1em}%
        \noindent
        \mbox{\@thefnmark~}{\tiny #1}}
        \stepcounter{footnote}\footnotetext{#1}}%
  \fi}
\def\@subtitlenotes{}
\def\subtitlenote#1{%
  \g@addto@macro\@subtitle{\footnotemark}%
  \if@CDR@anonymous
    \g@addto@macro\@subtitlenotes{%
      \stepcounter{footnote}\footnotetext{Subtitle note}}%
  \else
    \g@addto@macro\@subtitlenotes{%\
        \renewcommand\@makefntext[1]{%
        \setlength\parindent{1em}%
        \noindent
        \mbox{\@thefnmark~}{\tiny #1}}
        \stepcounter{footnote}\footnotetext{#1}}%
  \fi}
\def\@authornotes{}
\def\authornote#1{% Here is the author footnotes
  \if@CDR@anonymous\else
    \g@addto@macro\addresses{\@authornotemark}%
    \g@addto@macro\@authornotes{%\
        \renewcommand\@makefntext[1]{%
        \setlength\parindent{1em}%
        \noindent
        \mbox{\@thefnmark~}{\tiny #1}}
        \stepcounter{footnote}\footnotetext{#1}}%
  \fi
  }
\newcommand\authornotemark[1][\relax]{%
  \if@CDR@anonymous\else
    \ifx#1\relax\relax\relax
      \g@addto@macro\addresses{\@authornotemark}%
    \else
      \g@addto@macro\addresses{\@@authornotemark{#1}}%
    \fi
  \fi}
\def\@affiliationnotes{}
\def\affiliationnote#1{% Here is the affiliation footnotes
  \if@CDR@anonymous\else
    \g@addto@macro\addresses{\@affiliationnum}%
    \g@addto@macro\@affiliationnotes{%\
        \renewcommand\@makefntext[1]{%
        \setlength\parindent{1em}%
        \noindent
        \mbox{\@thefnmark~}{\scriptsize #1}}
        \stepcounter{footnote}\footnotetext{#1}}%
  \fi}
\newcommand\affiliationnum[1][\relax]{%
  \if@CDR@anonymous\else
    \ifx#1\relax\relax\relax
      \g@addto@macro\addresses{\@affiliationnum}%
    \else
      \g@addto@macro\addresses{\@@affiliationnum{#1}}%
    \fi
  \fi}
\def\cdrVolume#1{\def\@cdrVolume{#1}}
\cdrVolume{1}
\def\cdrNumber#1{\def\@cdrNumber{#1}}
\cdrNumber{1}
\def\cdrArticle#1{\def\@cdrArticle{#1}}
\cdrArticle{}
\def\cdrArticleSeq#1{\def\@cdrArticleSeq{#1}}
\cdrArticleSeq{\@cdrArticle}
\def\cdrYear#1{\def\@cdrYear{#1}}
\cdrYear{\the\year}
\def\cdrMonth#1{\def\@cdrMonth{#1}}
\cdrMonth{\the\month}
\def\@cdrPubDate{\ifcase\@cdrMonth\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or
  December\fi~\@cdrYear}
\def\cdrPrice#1{\ClassWarning{\@classname}{The macro \string\cdrPrice
    is obsolete.  CDR no longer prints the price in bibstrip.}}
\def\cdrSubmissionID#1{\def\@cdrSubmissionID{#1}}
\cdrSubmissionID{}
\def\cdrISBN#1{\def\@cdrISBN{#1}}
\cdrISBN{978-x-xxxx-xxxx-x/YYYY/MM}
\def\cdrDOI#1{\def\@cdrDOI{#1}}
\cdrDOI{10.1145/nnnnnnn.nnnnnnn}
\def\authorImage#1{\def\@authorImage{#1}}
\authorImage{}
\def\biographySectionTitle#1{\def\@biographySectionTitle{#1}}
\biographySectionTitle{ABOUT THE AUTHOR(s)}
\newlength\@CDR@badge@width
\setlength\@CDR@badge@width{3pc}
\newlength\@CDR@title@width
\newlength\@CDR@badge@skip
\setlength\@CDR@badge@skip{1pt}
\def\@cdrBadgeR{}
\def\@cdrBadgeL{}
\newcommand\cdrBadgeR[2][]{%
  \ifx\@cdrBadgeR\@empty
    \gdef\@cdrBadgeR{%
      \smash{%
        \raisebox{0.5\height}{%
          \href{#1}{\includegraphics[width=\@CDR@badge@width]{#2}}}}}%
  \else
    \g@addto@macro{\@cdrBadgeR}{%
      \hspace{\@CDR@badge@skip}%
      \smash{%
        \raisebox{0.5\height}{%
          \href{#1}{\includegraphics[width=\@CDR@badge@width]{#2}}}}}%
  \fi}
\newcommand\cdrBadgeL[2][]{%
  \ifx\@cdrBadgeL\@empty
    \gdef\@cdrBadgeL{%
      \smash{%
        \raisebox{0.5\height}{%
          \href{#1}{\includegraphics[width=\@CDR@badge@width]{#2}}}}}%
  \else
    \g@addto@macro{\@cdrBadgeL}{%
      \hspace{\@CDR@badge@skip}%
      \smash{%
        \raisebox{0.5\height}{%
          \href{#1}{\includegraphics[width=\@CDR@badge@width]{#2}}}}}%
  \fi}
\let\cdrBadge=\cdrBadgeR
\def\startPage#1{\def\@startPage{#1}}
\startPage{}
\def\terms#1{\ClassWarning{\@classname}{The command \string\terms{} is
    obsolete.  I am going to ignore it}}
\def\keywords#1{\def\@keywords{#1}}
\let\@keywords\@empty
\AtEndDocument{\ifx\@keywords\@empty
  \ifnum\getrefnumber{TotPages}>2\relax
  \ClassWarningNoLine{\@classname}{CDR keywords are mandatory
    for papers over two pages}%
  \fi\fi}
\renewenvironment{abstract}{\Collect@Body\@saveabstract}{}
\long\def\@saveabstract#1{\if@CDR@maketitle@typeset
  \ClassError{\@classname}{Abstract must be defined before maketitle
    command. Please move it!}\fi
  \long\gdef\@abstract{#1}}
\@saveabstract{}
\long\def\@lempty{}
\define@boolkey+{@CDR@topmatter@}[@CDR@]{printccs}[true]{%
  \if@CDR@printccs
    \ClassInfo{\@classname}{Printing CCS}%
  \else
    \ClassInfo{\@classname}{Suppressing CCS}%
  \fi}{\ClassError{\@classname}{The option printccs can be either true or false}}
\define@boolkey+{@CDR@topmatter@}[@CDR@]{printcdrref}[false]{%
  \if@CDR@printcdrref
    \ClassInfo{\@classname}{Printing bibformat}%
  \else
    \ClassInfo{\@classname}{Suppressing bibformat}%
  \fi}{\ClassError{\@classname}{The option printcdrref can be either true or false}}
\define@boolkey+{@CDR@topmatter@}[@CDR@]{printfolios}[true]{%
  \if@CDR@printfolios
    \ClassInfo{\@classname}{Printing folios}%
  \else
    \ClassInfo{\@classname}{Suppressing folios}%
  \fi}{\ClassError{\@classname}{The option printfolios can be either true or false}}
\define@cmdkey{@CDR@topmatter@}[@CDR@]{authorsperrow}[0]{%
  \IfInteger{#1}{\ClassInfo{\@classname}{Setting authorsperrow to
      #1}}{\ClassWarning{\@classname}{The parameter authorsperrow must be
      numerical. Ignoring the input #1}\gdef\@CDR@authorsperrow{0}}}
\def\settopmatter#1{\setkeys{@CDR@topmatter@}{#1}}
\settopmatter{printccs=true, printcdrref=false}
\if@CDR@cdrreview
  \settopmatter{printfolios=true}
\else
  \if@CDR@journal
    \settopmatter{printfolios=true}
  \else
    \settopmatter{printfolios=false}
  \fi
\fi
\settopmatter{authorsperrow=0}
\def\@received{}
\newcommand\received[2][]{\def\@tempa{#1}% Here is the Received; revised; accepted line
  \ifx\@tempa\@empty
    \ifx\@received\@empty
      \gdef\@received{Received #2}%
    \else
      \g@addto@macro{\@received}{; revised #2}%
    \fi
  \else
    \ifx\@received\@empty
      \gdef\@received{ #1 #2}%
    \else
      \g@addto@macro{\@received}{; #1 #2}%
    \fi
  \fi}
\AtEndDocument{%
  \ifx\@received\@empty\else
    \par\bigskip\noindent{\scriptsize\@received}\par%
  \fi}
\define@choicekey+{CDR}{articletype}[\CDR@ArticleType\CDR@ArticleType@nr]{%
  Research Article,Professional Commentary,Senior Leader Perspective,Editorial}[Research Article]{%
  \ifcase\CDR@ArticleType@nr
  \relax % Research Article
     \colorlet{@CDR@Article@color}{CDRBlue}%
  \or % Professional Commentary
     \colorlet{@CDR@Article@color}{CDROrange}%
  \or % Senior Leader Perspective
     \colorlet{@CDR@Article@color}{CDRGreen}%
  \or % Editorial
     \colorlet{@CDR@Article@color}{CDRGreen}%
  \fi
}{%
 \ClassError{\@classname}{Article Type must be Research Article, Professional Commentary, Senior Leader Perspective, or Editorial\MessageBreak
   Discussion}}
\def\cdrArticleType#1{\setkeys{CDR}{articletype=#1}}
\newenvironment{@CDR@color@frame}{%
  \def\FrameCommand{\hspace*{-6.5pc}%
    \colorbox{@CDR@Article@color!10!white}}%
  \MakeFramed {\advance\hsize
    -6.5pc\relax\FrameRestore}}{\zsaveposy{@CDR@cdrcpframe@y}%
  \endMakeFramed}
\def\cdrCodeLink#1{%
  \ifx\@cdrCodeDataLink\@empty
     \gdef\@cdrCodeDataLink{\url{#1}}%
  \else
     \g@addto@macro{\@cdrCodeDataLink}{\\ \url{#1}}%
  \fi}
\def\@cdrCodeDataLink{}
\def\cdrContributions#1{\gdef\@cdrContributions{#1}}
\cdrContributions{}
\let\cdrDataLink\cdrCodeLink
\RequirePackage{comment}
\excludecomment{CCSXML}
\let\@concepts\@empty
\newcounter{@concepts}
\newcommand\ccsdesc[2][100]{%
  \ccsdesc@parse#1~#2~~\ccsdesc@parse@end}
\def\textrightarrow{$\rightarrow$}
\def\ccsdesc@parse#1~#2~#3~{%
  \stepcounter{@concepts}%
  \expandafter\ifx\csname CCS@General@#2\endcsname\relax
    \expandafter\gdef\csname CCS@General@#2\endcsname{\textbullet\
      \textbf{#2}}%
    \expandafter\gdef\csname CCS@Punctuation@#2\endcsname{; }%
    \expandafter\gdef\csname CCS@Specific@#2\endcsname{}%
  \g@addto@macro{\@concepts}{\csname CCS@General@#2\endcsname
    \csname CCS@Punctuation@#2\endcsname
    \csname CCS@Specific@#2\endcsname}%
  \fi
  \ifx#3\relax\relax\else
    \expandafter\gdef\csname CCS@Punctuation@#2\endcsname{
      \textrightarrow\ }%
    \expandafter\g@addto@macro\expandafter{\csname CCS@Specific@#2\endcsname}{%
     \addtocounter{@concepts}{-1}%
     \ifnum#1>499\textbf{#3}\else
     \ifnum#1>299\textit{#3}\else
     #3\fi\fi\ifnum\value{@concepts}=0.\else; \fi}%
  \fi
\ccsdesc@parse@finish}
\def\ccsdesc@parse@finish#1\ccsdesc@parse@end{}
\newif\if@printcopyright
\@printcopyrighttrue
\newif\if@printpermission
\@printpermissiontrue
\newif\if@cdrowned
\@cdrownedtrue
\define@choicekey*{CDR@}{cdrcopyrightmode}[%
  \cdr@copyrightinput\cdr@copyrightmode]{none,%
    cdrcopyright,cdrlicensed,rightsretained,%
    usgov,usgovmixed,cagov,cagovmixed,licensedusgovmixed,%
    licensedcagov,licensedcagovmixed,othergov,licensedothergov,%
    iw3c2w3,iw3c2w3g,cdr,cc}{%
  \@printpermissiontrue
  \@printcopyrighttrue
  \@cdrownedtrue
  \ifnum\cdr@copyrightmode=0\relax % none
   \@printpermissionfalse
   \@printcopyrightfalse
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=2\relax % cdrlicensed
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=3\relax % rightsretained
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=4\relax % usgov
   \@printpermissiontrue
   \@printcopyrightfalse
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=6\relax % cagov
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=8\relax % licensedusgovmixed
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=9\relax % licensedcagov
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=10\relax % licensedcagovmixed
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=11\relax % othergov
   \@cdrownedtrue
  \fi
  \ifnum\cdr@copyrightmode=12\relax % licensedothergov
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=13\relax % iw3c2w3
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=14\relax % iw3c2w3g
   \@cdrownedfalse
  \fi  
  \ifnum\cdr@copyrightmode=15\relax % cdr
   \@printpermissiontrue
   \@cdrownedfalse
  \fi
  \ifnum\cdr@copyrightmode=16\relax % cc
   \@cdrownedfalse
  \fi}
\def\setcopyright#1{\setkeys{CDR@}{cdrcopyrightmode=#1}}
\setcopyright{cdrlicensed}
\newcommand\setcctype[2][4.0]{%
  \def\CDR@cc@version{#1}%
  \def\CDR@cc@type{#2}}
\setcctype{by}
\def\@copyrightowner{%
  %\lseries\itshape
  \itshape
  \ifcase\cdr@copyrightmode\relax % none
  \or % cdrcopyright
  CDR\@.
  \or % cdrlicensed
  Copyright held by the owner/author(s). Publication rights licensed to
  CDR\@.
  \or % rightsretained
  Copyright held by the owner/author(s).
  \or % usgov
  This is a work of the U.S. Government and is not subject to copyright protection in the United States. Foreign copyrights may apply.
  \or % usgovmixed
  This article includes contributions by U.S. Government employees acting within the scope of their official duties, which are not subject to U.S. copyright protection. Foreign copyrights may apply. All other content is copyrighted by the non-Government authors. As an open access journal, The Cyber Defense Review publishes articles under Creative Commons licenses, and authors retain copyright where applicable.
  \or % cagov
  Copyright Crown in Right of Canada.
  \or %cagovmixed
  Copyright held by the owner/author(s).
  \or %licensedusgovmixed
  Copyright held by the owner/author(s). Publication rights licensed to
  CDR\@.
  \or % licensedcagov
  Copyright held by the owner/author(s).
  \or %licensedcagovmixed
  Copyright held by the owner/author(s). Publication rights licensed to
  CDR\@.
  \or % othergov
  Copyright held by the owner/author(s).
  \or % licensedothergov
  Copyright held by the owner/author(s). Publication rights licensed to
  CDR\@.
  \or % ic2w3www
  IW3C2 (International World Wide Web Conference Committee), published
  under Creative Commons CC-BY~4.0 License.
  \or % ic2w3wwwgoogle
  IW3C2 (International World Wide Web Conference Committee), published
  under Creative Commons CC-BY-NC-ND~4.0 License.
  \or % cdr
  The Author(s) unless otherwise stated. As an open access journal, The Cyber Defense Review publishes articles under Creative Commons licenses, and authors retain copyright where applicable.
  \or % cc
  Copyright held by the owner/author(s).
  \fi}
\def\@formatdoi#1{\url{https://doi.org/#1}}
\def\@copyrightpermission{%
  %\lseries\itshape
  \itshape
  \ifcase\cdr@copyrightmode\relax % none
  \or % cdrcopyright
   Permission to make digital or hard copies of all or part of this
   work for personal or classroom use is granted without fee provided
   that copies are not made or distributed for profit or commercial
   advantage and that copies bear this notice and the full citation on
   the first page. Copyrights for components of this work owned by
   others than CDR must be honored. Abstracting with credit is
   permitted. To copy otherwise, or republish, to post on servers or
   to redistribute to lists, requires prior specific permission
   and\hspace*{.5pt}/or
   a fee. Request permissions from permissions@cdr.org.
  \or % cdrlicensed
   Permission to make digital or hard copies of all or part of this
   work for personal or classroom use is granted without fee provided
   that copies are not made or distributed for profit or commercial
   advantage and that copies bear this notice and the full citation on
   the first page. Copyrights for components of this work owned by
   others than the author(s) must be honored. Abstracting with credit
   is permitted. To copy otherwise, or republish, to post on servers
   or to redistribute to lists, requires prior specific permission
   and\hspace*{.5pt}/or a fee. Request permissions from
   permissions@cdr.org.
  \or % rightsretained
   Permission to make digital or hard copies of all or part of this
   work for personal or classroom use is granted without fee provided
   that copies are not made or distributed for profit or commercial
   advantage and that copies bear this notice and the full citation on
   the first page. Copyrights for third-party components of this work
   must be honored. For all other uses, contact the
   owner\hspace*{.5pt}/author(s).
  \or % usgov
   {\sbseries Disclaimer:} The views expressed in this work are those of the author(s) and do not reflect the official policy or position of their employer(s), the U.S. Military Academy, the Department of War, the U.S. Government, or any subdivisions thereof.
  \or % usgovmixed
   {\sbseries Disclaimer:} The views expressed in this work are those of the author(s) and do not reflect the official policy or position of their employer(s), the U.S. Military Academy, the Department of War, the U.S. Government, or any subdivisions thereof.
  \or % cagov
   This article was authored by employees of the Government of
   Canada. As such, the Canadian government retains all interest in
   the copyright to this work and grants to CDR a nonexclusive,
   royalty-free right to publish or reproduce this article, or to
   allow others to do so, provided that clear attribution is given
   both to the authors and the Canadian government agency employing
   them. Permission to make digital or hard copies for personal or
   classroom use is granted. Copies must bear this notice and the full
   citation on the first page. Copyrights for components of this work
   owned by others than the Canadian Government must be honored. To
   copy otherwise, distribute, republish, or post, requires prior
   specific permission and/or a fee. Request permissions from
   owner\hspace*{.5pt}/author(s).
  \or % cagovmixed
   CDR acknowledges that this contribution was co-authored by an
   affiliate of the national government of Canada. As such, the Crown
   in Right of Canada retains an equal interest in the
   copyright. Reprints must include clear attribution to CDR and the
   author’s government agency affiliation. Permission to make digital
   or hard copies for personal or classroom use is granted. Copies
   must bear this notice and the full citation on the first
   page. Copyrights for components of this work owned by others than
   CDR must be honored. To copy otherwise, distribute, republish, or
   post, requires prior specific permission and/or a fee. Request
   permissions from owner\hspace*{.5pt}/author(s).
  \or % licensedusgovmixed
   Publication rights licensed to CDR\@. CDR acknowledges that this
   contribution was authored or co-authored by an employee, contractor
   or affiliate of the United States government. As such, the
   Government retains a nonexclusive, royalty-free right to publish or
   reproduce this article, or to allow others to do so, for Government
   purposes only. Request permissions from
   owner\hspace*{.5pt}/author(s).
  \or % licensedcagov
   This article was authored by employees of the Government of
   Canada. As such, the Canadian government retains all interest in
   the copyright to this work and grants to CDR a nonexclusive,
   royalty-free right to publish or reproduce this article, or to
   allow others to do so, provided that clear attribution is given
   both to the authors and the Canadian government agency employing
   them. Permission to make digital or hard copies for personal or
   classroom use is granted. Copies must bear this notice and the full
   citation on the first page. Copyrights for components of this work
   owned by others than the Canadian Government must be honored. To
   copy otherwise, distribute, republish, or post, requires prior
   specific permission and/or a fee. Request permissions from
   owner\hspace*{.5pt}/author(s).
  \or % licensedcagovmixed
   Publication rights licensed to CDR. CDR acknowledges that this
   contribution was authored or co-authored by an employee, contractor
   or affiliate of the national government of Canada. As such, the
   Government retains a nonexclusive, royalty-free right to publish or
   reproduce this article, or to allow others to do so, for Government
   purposes only. Request permissions from
   owner\hspace*{.5pt}/author(s).
  \or % othergov
   CDR acknowledges that this contribution was authored or co-authored
   by an employee, contractor or affiliate of a national
   government. As such, the Government retains a nonexclusive,
   royalty-free right to publish or reproduce this article, or to
   allow others to do so, for Government purposes only. Request
   permissions from owner\hspace*{.5pt}/author(s).
  \or % licensedothergov
   Publication rights licensed to CDR\@. CDR acknowledges that this
   contribution was authored or co-authored by an employee, contractor
   or affiliate of a national government. As such, the Government
   retains a nonexclusive, royalty-free right to publish or reproduce
   this article, or to allow others to do so, for Government purposes
   only. Request permissions from owner\hspace*{.5pt}/author(s).
 \or % iw3c2w3
   This paper is published under the Creative Commons Attribution~4.0
   International (CC-BY~4.0) license. Authors reserve their rights to
   disseminate the work on their personal and corporate Web sites with
   the appropriate attribution.
 \or % iw3c2w3g
   This paper is published under the Creative Commons
   Attribution-NonCommercial-NoDerivs~4.0 International
   (CC-BY-NC-ND~4.0) license. Authors reserve their rights to
   disseminate the work on their personal and corporate Web sites with
   the appropriate attribution.
 \or % cdr
   {\sbseries Disclaimer:} The views expressed in this work are those of the author(s) and do not reflect the official policy or position of their employer(s), the U.S. Military Academy, the Department of War, the U.S. Government, or any subdivisions thereof.
 \or % CC
   \IfEq{\CDR@cc@type}{zero}{%
     \def\CDR@CC@Url{https://creativecommons.org/publicdomain/zero/1.0}}{%
  \edef\CDR@CC@Url{https://creativecommons.org/licenses/\CDR@cc@type/\CDR@cc@version}}%
   \href{\CDR@CC@Url}{\includegraphics[height=5ex]{doclicense-CC-\CDR@cc@type-88x31}}\\
   \href{\CDR@CC@Url}{%
   This work is licensed under a Creative Commons
   \IfEq{\CDR@cc@type}{zero}{CC0 1.0 Universal}{%
     \IfEq{\CDR@cc@type}{by}{Attribution}{}%
     \IfEq{\CDR@cc@type}{by-sa}{Attribution-ShareAlike}{}%
     \IfEq{\CDR@cc@type}{by-nd}{Attribution-NoDerivatives}{}%
     \IfEq{\CDR@cc@type}{by-nc}{Attribution-NonCommercial}{}%
     \IfEq{\CDR@cc@type}{by-nc-sa}{Attribution-NonCommercial-ShareAlike}{}%
     \IfEq{\CDR@cc@type}{by-nc-nd}{Attribution-NonCommercial-NoDerivatives}{}%
     ~\IfEq{\CDR@cc@version}{4.0}{4.0 International}{3.0 Unported}%
   }
   License.}%
 \fi}
%%
\def\copyrightyear#1{\def\@copyrightyear{#1}}
\copyrightyear{\@cdrYear}
\def\@teaserfigures{}
\newenvironment{teaserfigure}{\Collect@Body\@saveteaser}{}
\long\def\@saveteaser#1{\g@addto@macro\@teaserfigures{\@teaser{#1}}}
\renewcommand{\thanks}[1]{%
  \@ifnotempty{#1}{%
    \if@CDR@anonymous
      \g@addto@macro\thankses{\thanks{A note}}%
   \else
    \g@addto@macro\thankses{\thanks{#1}}%
   \fi}}
\newcommand{\anon}[2][ANONYMIZED]{%
  \if@CDR@anonymous%
    {\color{CDROrange}#1}%
  \else%
    #2%
  \fi}
\ifx\@beginmaketitlehook\@undefined
  \let\@beginmaketitlehook\@empty
\fi
\def\AtBeginMaketitle{\g@addto@macro\@beginmaketitlehook}
\def\@cdrengagemetadata{}
\def\setengagemetadata#1#2{%
  \g@addto@macro{\@cdrengagemetadata}{%
    \@setengagemetadata{#1}{#2}}}
\newbox\mktitle@bx
\def\maketitle{\@beginmaketitlehook
  \@CDR@maketitle@typesettrue
  \if@CDR@anonymous
    % Anonymize omission of \author-s
    \ifnum\num@authorgroups=0\author{}\fi
  \fi
  \begingroup
  \let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig
  \let\@footnotemark\@footnotemark@nolink
  \let\@footnotetext\@footnotetext@nolink
  \renewcommand\thefootnote{\scriptsize\@fnsymbol\c@footnote}% Here is the footnote style
  \renewcommand\thefootnoteA{\scriptsize\@fnsymbol\c@footnoteA}% Here is the footnote style
  \renewcommand\thefootnoteB{\scriptsize\@arabic\c@footnoteB}%
  \hsize=\textwidth
  \def\@makefnmark{\hbox{\@textsuperscript{\@thefnmark}}}%
  \@mktitle\@mkauthors\@mkteasers
  \@printtopmatter
  \setcounter{footnote}{0}%
  \def\@makefnmark{\hbox{\@textsuperscript{@thefnmark}}}%
  \@titlenotes
  \@subtitlenotes
  \@authornotes
  \let\@makefnmark\relax
  \let\@thefnmark\relax
  \let\@makefntext\noindent
  \ifx\@empty\thankses\else
    \footnotetextauthorsaddresses{%
      \def\par{\let\par\@par}\parindent\z@\@setthanks}%
  \fi
  \parindent\z@\parskip0.1\baselineskip
  \ifnum\cdr@copyrightmode=16\relax % cc
       \footnotetextcopyrightpermission{\@copyrightpermission}%
  \else
    \footnotetextcopyrightpermission
    {%
        % \if@CDR@authordraft
        %     \raisebox{-2ex}[\z@][\z@]{\makebox[0pt][l]{\large\bfseries
        %         Unpublished draft. Not for distribution.}}%
        %    \color[gray]{0.9}%
        % \fi
        \if@printpermission\tiny\@copyrightpermission\par\fi % Here is the disclaimer
        \if@printcopyright 
          \tiny\copyright\ \@copyrightyear\ \@copyrightowner\par % Here is the copyright with the c
        \else
          \tiny \ifx\@copyrightyear\@empty\else\@copyrightyear.\ \fi\@copyrightowner\par % Here is the copyright without the c
        \fi
        \fi
    }%
  \fi
  \endgroup
  \if@CDR@engage\@typesetengagemetadata\fi
  \setcounter{footnote}{0}% Here is the footnote settings, reset footnote count
  \renewcommand\thefootnote{\tiny\@arabic\c@footnote}% Here is the footnote style
  \renewcommand\@makefntext[1]{%
    \setlength\parindent{1em}%
    \noindent\tiny\lseries
    \mbox{\@thefnmark.~}{##1}}
  \@mkabstract
  \ifx\@translatedabstracts\@empty\else
  \@translatedabstracts\fi
  \if@CDR@printccs
  \ifx\@concepts\@empty\else\bgroup
      {\@specialsection{CCS Concepts}%
         \noindent\@concepts\par}\egroup
     \fi
   \fi
    \ifx\@keywords\@empty\else\bgroup
        {\@specialsection{\scriptsize\keywordsname}% Here is the keywords
           \noindent\@keywords\par}\egroup
    \fi
    \ifx\@translatedkeywords\@empty\else
       \@translatedkeywords
    \fi
  \let\metadata@authors=\authors
  \nxandlist{, }{, }{, }\metadata@authors
  \def\@CDR@checkaffil{}%
  \hypersetup{%
    pdfauthor={\metadata@authors},
    pdftitle={\@title},
    pdfsubject={\@concepts},
    pdfkeywords={\@keywords},
    pdfcreator={LaTeX with cdrart
      \csname ver@\@classname.cls\endcsname\space
      and hyperref
      \csname ver@hyperref.sty\endcsname}}%
  \andify\authors
  \andify\shortauthors
  \global\let\authors=\authors
  \global\let\shortauthors=\shortauthors
  \if@CDR@printcdrref
     \@mkbibcitation
  \fi
  \global\@topnum\z@ % this prevents floats from falling
                     % at the top of page 1
  \global\@botnum\z@ % we do not want them to be on the bottom either
  \@printendtopmatter
  \@afterindentfalse
  \@afterheading
}
\def\@specialsection#1{% Here is the special section
  \let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig
  \ifcase\CDR@format@nr
  \relax % cdrreview
    \par\bigskip\small\noindent#1: % Here is the Keywords font
  \or % cdrprint
    \par\bigskip\small\noindent#1: %
  \fi
  \let\@vspace\@vspace@cdr
  \let\@vspacer\@vspacer@cdr
}
\def\@printtopmatter{%
  \ifx\@startPage\@empty
     \gdef\@startPage{1}%
  \else
     \setcounter{page}{\@startPage}%
  \fi
  \@tempdima=\ht\mktitle@bx
  \advance\@tempdima by \dp\mktitle@bx
  \ifdim\@tempdima>0.9\textheight
    \loop
      \setbox\@tempboxa=\vsplit \mktitle@bx to 0.9\textheight
      \thispagestyle{firstpagestyle}%
      \noindent\unvbox\@tempboxa
      \clearpage
      \@tempdima=\ht\mktitle@bx
      \advance\@tempdima by \dp\mktitle@bx
    \ifdim\@tempdima>0.9\textheight\repeat
  \fi
  \thispagestyle{firstpagestyle}%
  \noindent
  \ifcase\CDR@format@nr
  \relax % cdrreview
    \box\mktitle@bx\par
  \or % cdrprint
    \box\mktitle@bx\par
  \fi
}
\def\@mktitle{%
  \ifcase\CDR@format@nr
  \relax % cdrreview
    \@mktitle@i
  \or % cdrprint
    \@mktitle@i
  \fi
}
\def\@titlefont{% Here is the title font
  \ifcase\CDR@format@nr
  \relax % cdrreview
    \setstretch{1}\LARGE\sbseries
  \or % cdrprint
    \setstretch{1.25}\LARGE\sbseries
  \fi}
\def\@subtitlefont{\normalsize % Here is the subtitle font
  \ifcase\CDR@format@nr
  \relax % cdrreview
    \Large\lseries
  \or % cdrprint
    \Large\lseries
  \fi}
\def\@journalinfofont{% Here is the journal information font
  \ifcase\CDR@format@nr
  \relax % cdrreview
    \scriptsize\sffamily
  \or % cdrprint
    \scriptsize\sffamily
  \fi}
\def\@mktitle@i{\hsize=\textwidth
  \@CDR@title@width=\hsize
  \setbox\mktitle@bx=\vbox{\noindent
    \parbox[t]{\@CDR@title@width}{\raggedright % Here is the title
    \vspace{-2pc}
    \begin{spacing}{.75}
      \scalebox{.9}[1]{\@journalinfofont\noindent\MakeUppercase{\@journalName}} \\ % Here is the journal header
      \if@CDR@cdrreview\else
      % Here is second line of journal header
      \if@CDR@inpress
          \scalebox{.9}[1]{\@journalinfofont\itshape{In press, \pageref*{TotPages} pages}} \\
      \else
          \scalebox{.9}[1]{\@journalinfofont\@cdrYear, VOL. \@cdrVolume, NO. \@cdrNumber, \@startPage-\pageref*{TotPages}} \\
      \fi
      \scalebox{.9}[1]{\@journalinfofont\@formatdoi{\@cdrDOI}}\fi % Here is the third line of the journal header
      \medskip {\color{lightgray} \hrule} % Here is the line after the journal header
      \end{spacing}
      \par\bigskip
      \scalebox{.9}[1]{\small\noindent\MakeUppercase{\CDR@ArticleType}} % Here is the article type
      \par\bigskip
      \linespread{1.444}\@titlefont\noindent
      \@title\@translatedtitle% Here is the title
  \ifx\@subtitle\@empty\else
    \par\noindent{\@subtitlefont\@subtitle\@translatedsubtitle}% Here is the subtitle
  \fi}%
  \par\bigskip {\color{gray} \noindent\rule{\textwidth}{2pt}}% Here is the lines after the title
  \par\vspace{-2.5ex}{\color{lightgray} \noindent\rule{\textwidth}{.25pt}}
  \par}}%
\newbox\@CDR@commabox
\def\@CDR@addtoaddress#1{%
  \ifvmode\else
    \if@CDR@affiliation@obeypunctuation\else
    \setbox\@CDR@commabox=\hbox{, }%
    \unskip\cleaders\copy\@CDR@commabox\hskip\wd\@CDR@commabox
  \fi\fi
  #1}
\def\streetaddress#1{\ClassWarning{\@classname}{CDR no longer collects
  authors' postal addresses.  I am ignoring your street
  address}\unskip\ignorespaces}
\def\postcode#1{\ClassWarning{\@classname}{CDR no longer collects
  authors' postal addresses.  I am ignoring your postal
  code}\unskip\ignorespaces}
\if@CDR@journal
  \def\num#1{\textsuperscript{#1}\ignorespaces}
  \def\position#1{\unskip\ignorespaces}
  \def\institution#1{\global\@CDR@instpresenttrue
    \unskip#1\ignorespaces}
  \def\city#1{\StrDel{#1}{ }[\@tempa]%
    \ifx\@tempa\@empty\else
    \global\@CDR@citypresenttrue\fi
    \if@CDR@affiliation@obeypunctuation\else, \fi#1\ignorespaces}
  \def\state#1{\if@CDR@affiliation@obeypunctuation\else, \fi#1\ignorespaces}
  \newcommand\department[2][0]{\unskip\ignorespaces}
  \def\country#1{\StrDel{#1}{ }[\@tempa]%
    \ifx\@tempa\@empty\else
    \global\@CDR@countrypresenttrue\fi
    \if@CDR@affiliation@obeypunctuation\else, \fi#1\ignorespaces}
\else
  \def\position#1{\if@CDR@affiliation@obeypunctuation#1\else#1\par\fi}%
  \def\institution#1{\global\@CDR@instpresenttrue
    \if@CDR@affiliation@obeypunctuation#1\else#1\par\fi}%
  \newcommand\department[2][0]{\if@CDR@affiliation@obeypunctuation
    #2\else#2\par\fi}%
  \def\city#1{\global\@CDR@citypresenttrue\@CDR@addtoaddress{#1}}%
  \let\state\@CDR@addtoaddress
  \def\country#1{\global\@CDR@countrypresenttrue\@CDR@addtoaddress{#1}}%
\fi
\def\@mkauthors{\begingroup
  \hsize=\textwidth
  \ifcase\CDR@format@nr
  \relax % cdrreview
    \@mkauthors@i
  \or % cdrprint
    \@mkauthors@i
  \fi
  \endgroup
}
\def\@authorfont{\large\sffamily} % Here is the author font
\def\@affiliationfont{\footnotesize\sffamily} % Here is the affiliation font
\ifcase\CDR@format@nr
\relax % cdrreview
  \def\@authorfont{\large\sffamily}
  \def\@affiliationfont{\footnotesize\sffamily\scalebox{.8}[1]}
\or % cdrprint
  \def\@authorfont{\large\sffamily}
  \def\@affiliationfont{\footnotesize\sffamily\scalebox{.8}[1]}
\fi
\def\@typeset@author@line{% Here is the author and affiliation line
  \andify\@currentauthors\par\noindent
  \scalebox{.8}[1]{\parbox{1.25\linewidth}{\@currentauthors\def\@currentauthors{}}}%
  \ifx\@currentaffiliations\@empty\else
    \andify\@currentaffiliations
      \unskip\vspace{1em}\@currentaffiliations\par
  \fi
  \def\@currentaffiliations{}}
\newif\if@CDR@instpresent
\@CDR@instpresenttrue
\newif\if@CDR@citypresent
\@CDR@citypresenttrue
\newif\if@CDR@countrypresent
\@CDR@countrypresenttrue
\def\@CDR@resetaffil{%
  \global\@CDR@instpresentfalse
  \global\@CDR@citypresentfalse
  \global\@CDR@countrypresentfalse
}
\def\@CDR@checkaffil{%
  \if@CDR@instpresent\else
  \ClassWarningNoLine{\@classname}{No institution present for an affiliation}%
  \fi
  \if@CDR@citypresent\else
  \ClassWarningNoLine{\@classname}{No city present for an affiliation}%
  \fi
  \if@CDR@countrypresent\else
  \ClassError{\@classname}{No country present for an affiliation}{CDR
    requires each author to indicate their country using country macro.}%
  \fi
}
\def\@mkauthors@i{% Here is the author line
  \def\@currentauthors{}%
  \def\@currentaffiliations{}%
  \global\let\and\@typeset@author@line
  \def\@author##1{%
    \ifx\@currentauthors\@empty
      \gdef\@currentauthors{\@authorfont{##1}}% MakeUppercase removed for CDR
    \else
       \g@addto@macro{\@currentauthors}{\@authorfont{, ##1}}% MakeUppercase removed for CDR
    \fi
    \gdef\and{}}%
  \def\email##1##2{}%
  \def\affiliation##1##2{%
    \def\@tempa{##2}\ifx\@tempa\@empty\else
       \ifx\@currentaffiliations\@empty
          \gdef\@currentaffiliations{\\\vspace{-2pt}% Here is the affiliation line, first affiliation
            \setkeys{@CDR@affiliation@}{obeypunctuation=false}%
            \setkeys{@CDR@affiliation@}{##1}%
            \@CDR@resetaffil
            \@affiliationfont{##2}\@CDR@checkaffil}%
       \else
         \g@addto@macro{\@currentaffiliations}{\\\vspace{-2pt}\noindent % Here is the affiliation line, multiple affiliations
           \setkeys{@CDR@affiliation@}{obeypunctuation=false}%
           \setkeys{@CDR@affiliation@}{##1}%
           \@CDR@resetaffil
           \@affiliationfont{##2}\@CDR@checkaffil}%
      \fi
    \fi
     \global\let\and\@typeset@author@line}%
  \global\setbox\mktitle@bx=\vbox{\noindent\unvbox\mktitle@bx\par\medskip
    \noindent\addresses\@typeset@author@line
   \par\vspace{2em}}%
}
\def\@mkauthorsaddresses{% Here is the corresponding author
  \ifnum\num@authors>1\relax
  Authors' \else Author's \fi
  Contact Information:
  \bgroup
  \def\streetaddress##1{\ClassWarning{\@classname}{CDR no longer collects
  authors' postal addresses.  I am ignoring your street
  address}\unskip\ignorespaces}%
  \def\postcode##1{\ClassWarning{\@classname}{CDR no longer collects
  authors' postal addresses.  I am ignoring your postal
  code}\unskip\ignorespaces}%
  \def\position##1{\unskip\ignorespaces}%
  \gdef\@CDR@institution@separator{, }%
  \def\institution##1{\unskip\@CDR@institution@separator ##1\gdef\@CDR@institution@separator{ and }}%
  \def\city##1{\unskip, ##1}%
  \def\state##1{\unskip, ##1}%
  \renewcommand\department[2][0]{\unskip\@addpunct, ##2}%
  \def\country##1{\unskip, ##1}%
  \def\and{\unskip; \gdef\@CDR@institution@separator{, }}%
  \def\@author##1{##1}%
  \def\email##1##2{\unskip, \nolinkurl{##2}}%
  \addresses
  \egroup}
\AtEndDocument{\if@CDR@journal
  \ifx\@authorsaddresses\@empty
  \ClassWarningNoLine{\@classname}{Authors'
    addresses are mandatory for CDR}%
  \fi\fi}
\def\@setaddresses{}
\def\@authornotemark{\g@addto@macro\@currentauthors{%
    \advance\hfuzz by 5pt\relax\footnotemarkA\relax}}
\def\@@authornotemark#1{\g@addto@macro\@currentauthors{%
    \advance\hfuzz by 5pt\relax\footnotemarkA[#1]}}
\def\@affiliationnum{\g@addto@macro\@currentauthors{%
    \advance\hfuzz by 5pt\relax\footnotemarkB\relax}}
\def\@@affiliationnum#1{\g@addto@macro\@currentauthors{%
    \advance\hfuzz by 5pt\relax\footnotemarkB[#1]}}
\def\@mkteasers{%
  \ifx\@teaserfigures\@empty\else
    \def\@teaser##1{\par\bigskip\bgroup
      \captionsetup{type=figure}##1\egroup\par}
    \global\setbox\mktitle@bx=\vbox{\noindent\unvbox\mktitle@bx\par
      \noindent\@Description@presentfalse
      \@teaserfigures\par\if@Description@present\else
         \global\@undescribed@imagestrue
         \ClassWarning{\@classname}{A possible image without
           description}\fi
    \medskip}%
  \fi}
\def\@mkabstract% Here is the abstract
{
    \bgroup
    \ifx\@abstract\@lempty
    \else
    {
        \phantomsection\addcontentsline{toc}{section}{\abstractname}%
        \if@CDR@journal
           \everypar{\setbox\z@\lastbox\everypar{}}
        \else
          \section*{\abstractname}%
        \fi
        \ignorespaces{\setlength{\parindent}{0cm}\footnotesize\itshape\@abstract}
    }
    \fi
    \egroup
}
\def\@mktranslatedabstract#1{\selectlanguage{#1}% Here is the translated abstract
    \if@CDR@journal
       \everypar{\setbox\z@\lastbox\everypar{}}\small
    \else
       \section*{\abstractname}%
    \fi
   \ignorespaces}
\def\@mkbibcitation{\bgroup
  \let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig
  \def\@pages@word{\ifnum\getrefnumber{TotPages}=1\relax page\else pages\fi}%
  \def\footnotemark{}%
  \def\\{\unskip{} \ignorespaces}%
  \def\footnote{\ClassError{\@classname}{Please do not use footnotes
      inside a \string\title{} or \string\author{} command! Use
      \string\titlenote{} or \string\authornote{} instead!}}%
  \def\@article@string{\ifx\@cdrArticle\@empty{\ }\else,
    Article~\@cdrArticle\ \fi}%
  \par\medskip\scriptsize\noindent{\bfseries Reference Format:}\par\nobreak
  \noindent\bgroup
    \def\\{\unskip{}, \ignorespaces}\authors\egroup. \@cdrYear. \@title
  \ifx\@subtitle\@empty. \else: \@subtitle. \fi
  \if@CDR@printcdrref
    \if@CDR@journal@bibstrip
       \textit{\@journalNameShort}
       \@cdrVolume, \@cdrNumber \@article@string (\@cdrPubDate),
       \ref{TotPages}~\@pages@word.
    \else
       In \textit{\@cdrBooktitle}%
       \ifx\@cdrEditors\@empty\textit{.}\else
         \andify\@cdrEditors\textit{, }\@cdrEditors~\@editorsAbbrev.%
       \fi\
       CDR, New York, NY, USA%
         \@article@string\unskip, \ref{TotPages}~\@pages@word.
    \fi
  \fi
  \ifx\@cdrDOI\@empty\else\@formatdoi{\@cdrDOI}\fi
\par\egroup}
\def\@printendtopmatter{%
  \let\@vspace\@vspace@orig
  \let\@vspacer\@vspacer@orig
  \par\bigskip
  \let\@vspace\@vspace@cdr
  \let\@vspacer\@vspacer@cdr
  }
\def\@setthanks{\long\def\thanks##1{\par##1\@addpunct.}\thankses}
\def\@setauthorsaddresses{\@authorsaddresses\unskip\@addpunct.}
\def\@typesetengagemetadata{%
  \def\@setengagemetadata##1##2{\par\noindent\textbf{##1} ##2\par}%
  \@cdrengagemetadata}
\RequirePackage{fancyhdr}
\let\CDR@ps@plain\ps@plain
\let\CDR@ps@myheadings\ps@myheadings
\let\CDR@ps@headings\ps@headings
\def\CDR@restore@pagestyle{%
  \let\ps@plain\CDR@ps@plain
  \let\ps@myheadings\CDR@ps@myheadings
  \let\ps@headings\CDR@ps@headings}
\AtBeginDocument{\CDR@restore@pagestyle}
\if@CDR@review
  \newsavebox{\CDR@linecount@bx}
  \newlength\CDR@linecount@bxht
  \newcount\CDR@linecount
  \CDR@linecount\@ne\relax
  \def\CDR@mk@linecount{%
    \savebox{\CDR@linecount@bx}[4em][t]{\parbox[t]{4em}{\normalfont
        \normalsize
        \setlength{\CDR@linecount@bxht}{0pt}%
        \loop{\color{red}\scriptsize\lseries\the\CDR@linecount}\\
        \global\advance\CDR@linecount by \@ne
        \addtolength{\CDR@linecount@bxht}{\baselineskip}%
        \ifdim\CDR@linecount@bxht<\textheight\repeat
        {\color{red}\scriptsize\lseries\the\CDR@linecount}\hfill
        \global\advance\CDR@linecount by \@ne}}}
\fi
\def\CDR@linecountL{% Here is the line count for review
  \if@CDR@review
  \CDR@mk@linecount
  \begin{picture}(0,0)%
    \put(-26,-22){\usebox{\CDR@linecount@bx}}%
  \end{picture}%
  \fi}
\def\CDR@linecountR{%
  \if@CDR@review
    \ifcase\CDR@format@nr
    \relax % cdrreview
         \relax
       \or % cdrprint
          \relax
    \fi
    \begin{picture}(0,0)%
      \put(20,-22){\usebox{\CDR@linecount@bx}}%
     \end{picture}%
  \fi}
\if@CDR@timestamp
  % Subtracting 30 from \time gives us the effect of rounding down despite
  % \numexpr rounding to nearest
  \newcounter{CDR@time@hours}
  \setcounter{CDR@time@hours}{\numexpr (\time - 30) / 60 \relax}
  \newcounter{CDR@time@minutes}
  \setcounter{CDR@time@minutes}{\numexpr \time - \theCDR@time@hours * 60 \relax}
  \newcommand\CDR@timestamp{%
    \footnotesize%
    \ifx\@cdrSubmissionID\@empty\relax\else
    Submission ID: \@cdrSubmissionID.{ }%
    \fi
    \the\year-\two@digits{\the\month}-\two@digits{\the\day}{ }%
    \two@digits{\theCDR@time@hours}:\two@digits{\theCDR@time@minutes}{. }%
    Page \thepage\ of \pageref*{TotPages}.%
  }
\fi
\def\@shortauthors{%
  \if@CDR@anonymous
    Anon.
    \ifx\@cdrSubmissionID\@empty\else Submission Id: \@cdrSubmissionID\fi
  \else\shortauthors\fi}
\def\@headfootfont{\footnotesize\sffamily\lseries}
\AtBeginDocument{%
\fancypagestyle{standardpagestyle}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{\z@}%
  \renewcommand{\footrulewidth}{\z@}%
  \def\@cdrArticlePage{%
    \ifx\@cdrArticle\empty%
      \if@CDR@printfolios\thepage\fi%
    \else%
      \@cdrArticle\if@CDR@printfolios:\thepage\fi%
    \fi%
  }%
  \if@CDR@journal@bibstrip % Here is the header and footer
    \ifcase\CDR@format@nr
    \relax % cdrreview
      \fancyhead[LE]{\CDR@linecountL \@headfootfont \shorttitle}%
      \fancyhead[LO]{\CDR@linecountL}%
      \fancyhead[RO]{\@headfootfont \@shortauthors}%
      \fancyfoot[RO]{\textcolor{darkgray}{\@headfootfont Manuscript submitted to The Cyber Defense Review \textbar \ \thepage}}%
      \fancyfoot[LE]{\textcolor{darkgray}{\@headfootfont \thepage \ \textbar \ Manuscript submitted to The Cyber Defense Review}}%
    \or % cdrprint
      \fancyhead[LE]{\scalebox{.9}[1]{\@headfootfont \shorttitle}}%
      \fancyhead[RO]{\scalebox{.9}[1]{\@headfootfont \@shortauthors}}%
      \fancyfoot[RO]{\textcolor{darkgray}{\@headfootfont VOL. \@cdrVolume, NO.
        \@cdrNumber ~(\@cdrYear) \textbar \ \thepage}}%
        \fancyfoot[LE]{\textcolor{darkgray}{\@headfootfont \thepage \ \textbar \ \MakeUppercase{\@journalName}}}%
    \fi
  \if@CDR@timestamp
     \fancyfoot[LO,RE]{\CDR@timestamp}
  \fi
}%
\pagestyle{standardpagestyle}
}
\AtBeginDocument{%
\fancypagestyle{firstpagestyle}{% Here is the first page header and footer
  \fancyhf{}%
  \renewcommand{\headrulewidth}{\z@}%
  \renewcommand{\footrulewidth}{\z@}%
  \if@CDR@journal@bibstrip
    \ifcase\CDR@format@nr
    \relax % cdrreview
      \fancyhead[L]{\CDR@linecountL}%
      \fancyfoot[RO]{\@headfootfont Manuscript submitted to The Cyber Defense Review \textbar \ \thepage}%
    \or % cdrprint
      \fancyfoot[RO]{\textcolor{darkgray}{\@headfootfont VOL. \@cdrVolume, NO.
        \@cdrNumber ~(\@cdrYear) \textbar \ \thepage}}%
  \if@CDR@timestamp
    \ifnum\CDR@format@nr=0\relax % cdrreview
    \fancyfoot[LO,RE]{\CDR@timestamp\quad
        \footnotesize Manuscript submitted to The Cyber Defense Review
    }
    \else
    \fancyfoot[LO,RE]{\CDR@timestamp}
    \fi
  \fi
}}
\def\CDR@NRadjust#1{%
 \begingroup
  \expandafter\ifx\csname Sectionformat\endcsname\relax
  % do nothing when  \Sectionformat  is unknown
   \def\next{\endgroup #1}%
 \else
  \def\next{\endgroup
   \let\realSectionformat\Sectionformat
   \def\CDR@sect@format@{#1}%
   \let\Sectionformat\CDR@NR@adjustedSectionformat
 %%  next lines added 2018-06-17 to ensure section number is styled
   \let\real@adddotafter\@adddotafter
   \let\@adddotafter\CDR@adddotafter
   #1{}% imposes the styles, but nullifies  \MakeUppercase
   \let\@adddotafter\real@adddotafter
  }%
 \fi \next
}
\def\CDR@NR@adjustedSectionformat#1#2{%
 \realSectionformat{\CDR@sect@format{#1}}{#2}%
 \let\Sectionformat\realSectionformat}
\DeclareRobustCommand{\CDR@sect@format}{\CDR@sect@format@}
\def\CDR@sect@format@null#1{#1}
\let\CDR@sect@format@\CDR@sect@format@null
\AtBeginDocument{%
 \expandafter\ifx\csname LTX@adddotafter\endcsname\relax
  \let\LTX@adddotafter\@adddotafter
 \fi
}
\def\CDR@adddotafter#1{\ifx\relax#1\relax\else\LTX@adddotafter{#1}\fi}
\renewcommand\section{% Here is the font for the body of the section
\setstretch{1.5}\lseries\fontsize{9.5}{9.5}\selectfont
\def\@toclevel{1}%
  \@startsection{section}{1}{\z@}%
  {-.5\baselineskip \@plus -2\p@ \@minus -.2\p@}%
  {.25\baselineskip}%
  {\CDR@NRadjust\@secfont}}
\renewcommand\subsection{
\setstretch{1.5}\lseries\fontsize{9.5}{9.5}\selectfont
\def\@toclevel{2}%
  \@startsection{subsection}{2}{\z@}%
  {-.3\baselineskip \@plus -2\p@ \@minus -.2\p@}%
  {.25\baselineskip}%
  {\CDR@NRadjust\@subsecfont}}
\renewcommand\subsubsection{
\setstretch{1.5}\lseries\fontsize{9.5}{9.5}\selectfont
\def\@toclevel{3}%
  \@startsection{subsubsection}{3}{\z@}%
  {-.5\baselineskip \@plus -2\p@ \@minus -.2\p@}%
  {-3.5\p@}%
  {\CDR@NRadjust{\@subsubsecfont\@adddotafter}}}
\let\CDR@old@section\section % Here is the section* to the ToC/PDF Bookmarks
\renewcommand\section{%
  \@ifstar{\CDR@section@star}{\CDR@old@section}%
}
\newcommand*\CDR@section@star[1]{%
  \CDR@old@section*{#1}% uses your existing style, unnumbered
  \addcontentsline{toc}{section}{#1}%
}
\let\CDR@old@subsection\subsection % Here is the subsection* to the ToC/PDF Bookmarks
\renewcommand\subsection{%
  \@ifstar{\CDR@subsection@star}{\CDR@old@subsection}%
}
\newcommand*\CDR@subsection@star[1]{%
  \CDR@old@subsection*{#1}% same typography as numbered
  \addcontentsline{toc}{subsection}{#1}%
}
\let\CDR@old@subsubsection\subsubsection % Here is the subsubsection* to the ToC/PDF Bookmarks
\renewcommand\subsubsection{%
  \@ifstar{\CDR@subsubsection@star}{\CDR@old@subsubsection}%
}
\newcommand*\CDR@subsubsection@star[1]{%
  \CDR@old@subsubsection*{#1}%
  \addcontentsline{toc}{subsubsection}{#1}%
}
\renewcommand\paragraph{
\setstretch{1.5}\lseries\fontsize{9.5}{9.5}\selectfont
\def\@toclevel{4}%
  \@startsection{paragraph}{4}{\parindent}%
  {-.5\baselineskip \@plus -2\p@ \@minus -.2\p@}%
  {-3.5\p@}%
  {\CDR@NRadjust{\@parfont\@adddotafter}}}
\newcommand\noindentparagraph{
\setstretch{1.5}\lseries\fontsize{9.5}{9.5}\selectfont
\def\@toclevel{4}%
  \@startsection{paragraph}{4}{\z@}%
  {-.5\baselineskip \@plus -2\p@ \@minus -.2\p@}%
  {-3.5\p@}%
  {\CDR@NRadjust{\@parfont}}}
\renewcommand\part{
\setstretch{1.5}\lseries\fontsize{9.5}{9.5}\selectfont
\def\@toclevel{9}%
  \@startsection{part}{9}{\z@}%
  {-10\p@ \@plus -4\p@ \@minus -2\p@}%
  {4\p@}%
  {\CDR@NRadjust\@parfont}}
\def\section@raggedright{\@rightskip\@flushglue
  \rightskip\@rightskip
  \leftskip\z@skip
  \parindent\z@}
\def\@secfont{\sffamily\bfseries\normalsize\section@raggedright\MakeUppercase}
\def\@subsecfont{\sffamily\mdseries\normalsize\section@raggedright}
\def\@subsubsecfont{\sffamily\itshape}
\def\@parfont{\itshape}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
\ifcase\CDR@format@nr % Here is the section font
\relax % cdrreview
    \def\@secfont{\setstretch{1.25}\sffamily\bfseries\normalsize\section@raggedright\MakeUppercase}
    \def\@subsecfont{\setstretch{1}\sffamily\mdseries\normalsize\section@raggedright}
    \def\@subsubsecfont{\sffamily\mdseries\itshape}
\or % cdrprint
    \def\@secfont{\setstretch{1.25}\sffamily\bfseries\normalsize\section@raggedright\MakeUppercase}
    \def\@subsecfont{\setstretch{1}\sffamily\mdseries\normalsize\section@raggedright}
    \def\@subsubsecfont{\sffamily\mdseries\itshape}
\fi
\AtBeginDocument{%
  \@for\@tempa:=-1,0,1,2,3,4,5\do{%
    \@ifundefined{r@tocindent\@tempa}{%
      \@xp\gdef\csname r@tocindent\@tempa\endcsname{0pt}}{}%
  }%
}
\def\@writetocindents{%
  \begingroup
  \@for\@tempa:=-1,0,1,2,3,4,5\do{%
    \immediate\write\@auxout{%
      \string\newlabel{tocindent\@tempa}{%
        \csname r@tocindent\@tempa\endcsname}}%
  }%
  \endgroup}
\def\@adddotafter#1{#1\@addpunct{.}}
\def\@addspaceafter#1{#1\@addpunct{\enspace}}
\providecommand*\@dotsep{4.5}
\def\@cdrplainbodyfont{\itshape}
\def\@cdrplainindent{\parindent}
\def\@cdrplainheadfont{\scshape}
\def\@cdrplainnotefont{\@empty}
\ifcase\CDR@format@nr
\relax % cdrreview
\or % cdrprint
\fi
\newtheoremstyle{cdrplain}%
  {.5\baselineskip\@plus.2\baselineskip
    \@minus.2\baselineskip}% space above
  {.5\baselineskip\@plus.2\baselineskip
    \@minus.2\baselineskip}% space below
  {\@cdrplainbodyfont}% body font
  {\@cdrplainindent}% indent amount
  {\@cdrplainheadfont}% head font
  {.}% punctuation after head
  {.5em}% spacing after head
  {\thmname{#1}\thmnumber{ #2}\thmnote{ {\@cdrplainnotefont(#3)}}}% head spec
\def\@cdrdefinitionbodyfont{\normalfont}
\def\@cdrdefinitionindent{\parindent}
\def\@cdrdefinitionheadfont{\itshape}
\def\@cdrdefinitionnotefont{\@empty}
\ifcase\CDR@format@nr
\relax % cdrreview
\or % cdrprint
\fi
\newtheoremstyle{cdrdefinition}%
  {.5\baselineskip\@plus.2\baselineskip
    \@minus.2\baselineskip}% space above
  {.5\baselineskip\@plus.2\baselineskip
    \@minus.2\baselineskip}% space below
  {\@cdrdefinitionbodyfont}% body font
  {\@cdrdefinitionindent}% indent amount
  {\@cdrdefinitionheadfont}% head font
  {.}% punctuation after head
  {.5em}% spacing after head
  {\thmname{#1}\thmnumber{ #2}\thmnote{ {\@cdrdefinitionnotefont(#3)}}}% head spec
\theoremstyle{cdrplain}
\AtEndPreamble{%
  \if@CDR@cdrthm
  \theoremstyle{cdrplain}
  \@ifundefined{theorem}{%
  \newtheorem{theorem}{Theorem}[section]
  }{}
  \@ifundefined{conjecture}{%
  \newtheorem{conjecture}[theorem]{Conjecture}
  }{}
  \@ifundefined{proposition}{%
  \newtheorem{proposition}[theorem]{Proposition}
  }{}
  \@ifundefined{lemma}{%
  \newtheorem{lemma}[theorem]{Lemma}
  }{}
  \@ifundefined{corollary}{%
  \newtheorem{corollary}[theorem]{Corollary}
  }{}
  \theoremstyle{cdrdefinition}
  \@ifundefined{example}{%
  \newtheorem{example}[theorem]{Example}
  }{}
  \@ifundefined{definition}{%
  \newtheorem{definition}[theorem]{Definition}
  }{}
  \fi
  \theoremstyle{cdrplain}
}
\def\@proofnamefont{\scshape}
\def\@proofindent{\indent}
\ifcase\CDR@format@nr
\relax % cdrreview
\or % cdrprint
\fi
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\@proofindent\hskip\labelsep
        {\@proofnamefont #1\@addpunct{.}}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\AtEndPreamble{%
  \if@CDR@pbalance
    \global\@CDR@balancefalse
    \ifcase\CDR@format@nr
    \relax % cdrreview
       \or % cdrprint
    \fi
  \fi
  \if@CDR@balance
    \ifcase\CDR@format@nr
    \relax % cdrreview
         \global\@CDR@balancefalse
       \or % cdrprint
         \global\@CDR@balancefalse
    \fi
  \fi
}
\AtEndDocument{%
  \if@CDR@balance
  \if@twocolumn
  \balance
  \fi\fi}
% \newcommand\biographyname{ABOUT THE AUTHOR}
\specialcomment{biography}{% Here is the biography section
    \begingroup
    \if@CDR@showauthorimage\else
        \section*{\@biographySectionTitle}
        %\phantomsection\addcontentsline{toc}{section}{\@biographySectionTitle}
    \fi
    \if@CDR@showauthorimage
        \vspace{-.5\baselineskip}
    \fi
    \begin{spacing}{1}
    \scriptsize\lseries
    \hspace*{1em}
        \if@CDR@showauthorimage
            \vspace{-.5\baselineskip}
            \begin{flushleft}
            \begin{minipage}[c][2in][t]{1.7in}
            \includegraphics[height=2in,width=1.6in]{\@authorImage}
            \end{minipage}
            \begin{minipage}[c][2in][b]{3.75in}
            \setlength{\parskip}{5pt}
        \fi
}{%
        \if@CDR@showauthorimage
            \end{minipage}
            \end{flushleft}
        \fi
    \end{spacing} 
    \endgroup
}
\newcommand\acksname{ACKNOWLEDGMENTS}
\specialcomment{acks}{%
  \begingroup
  \section*{\acksname}
  %\phantomsection\addcontentsline{toc}{section}{\acksname}
  \begin{spacing}{1}
  \scriptsize\lseries
}{%
  \end{spacing} 
  \endgroup
}
\def\grantsponsor#1#2#3{#2}
\newcommand\grantnum[3][]{#3%
  \def\@tempa{#1}\ifx\@tempa\@empty\else\space(\url{#1})\fi}
\AtEndPreamble{%
\if@CDR@screen
  \includecomment{screenonly}
  \excludecomment{printonly}
\else
  \excludecomment{screenonly}
  \includecomment{printonly}
\fi
\if@CDR@anonymous
  \excludecomment{anonsuppress}
  \ifnum\CDR@ArticleType@nr=0
    \excludecomment{biography}
    \excludecomment{acks}
  \fi
\else
  \includecomment{anonsuppress}
\fi}
\newcommand\showeprint[2][arxiv]{%
  \def\@tempa{#1}%
  \ifx\@tempa\@empty\def\@tempa{arxiv}\fi
  \def\@tempb{arxiv}%
  \ifx\@tempa\@tempb\relax
     arXiv:\href{https://arxiv.org/abs/#2}{#2}%
  \else
     \def\@tempb{arXiv}%
     \ifx\@tempa\@tempb\relax
       arXiv:\href{https://arxiv.org/abs/#2}{#2}%
     \else
       #1:#2%
    \fi
  \fi}
\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
  \columnseprule\z@ \columnsep 35\p@
  \@indextitlestyle
  \let\item\@idxitem
  \parindent\z@  \parskip\z@\@plus.3\p@\relax
  \raggedright
  \hyphenpenalty\@M
  \footnotesize}
\let\@vspace@orig=\@vspace
\let\@vspacer@orig=\@vspacer
\apptocmd{\@vspace}{\ClassWarning{\@classname}{\string\vspace\space should
    only be used to provide space above/below surrounding
    objects. You can ignore this warning if \string\vspace\space is not actually used}}{}{}
\apptocmd{\@vspacer}{\ClassWarning{\@classname}{\string\vspace\space should
    only be used to provide space above/below surrounding
    objects. You can ignore this warning if \string\vspace\space is not actually used}}{}{}
\let\@vspace@cdr=\@vspace
\let\@vspacer@cdr=\@vspacer
\let\CDR@origbaselinestretch\baselinestretch
\let\CDR@origsection\section
\AtEndDocument{\ifx\section\CDR@origsection\else
  \ClassError{\@classname}{An attempt to redefine
    \string\section\space detected.  Please do not do this for
    CDR submissions!}\fi}
\let\CDR@origsubsection\subsection
\AtEndDocument{\ifx\subsection\CDR@origsubsection\else
  \ClassError{\@classname}{An attempt to redefine
    \string\subsection\space detected.  Please do not do this for
    CDR submissions!}\fi}
\let\CDR@origsubsubsection\subsubsection
\AtEndDocument{\ifx\subsubsection\CDR@origsubsubsection\else
  \ClassError{\@classname}{An attempt to redefine
    \string\subsubsection\space detected.  Please do not do this for
    CDR submissions!}\fi}
\let\CDR@origparagraph\paragraph
\AtEndDocument{\ifx\paragraph\CDR@origparagraph\else
  \ClassError{\@classname}{An attempt to redefine
    \string\paragraph\space detected.  Please do not do this for
    CDR submissions!}\fi}
\normalsize\normalfont\frenchspacing
\endinput
%%
%% End of file `cdrart.cls'.