" This .vimrc file should be placed in your home directory
" The Terminal app supports (at least) 16 colors
" So you can have the eight dark colors and the eight light colors
" the plain colors, using these settings, are the same as the light ones
" NOTE: You will need to replace ^[ with a raw Escape character, which you
" can type by typing Ctrl-V and then (after releaseing Ctrl-V) the Escape key.

if has("terminfo")
  set t_Co=16
  set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
  set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
else
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Everything from here on down is optional

let mapleader = '-'
imap <leader>4 <Space><Space><Space><Space><Space>
imap <leader>5 <Space><Space><Space><Space><Space><Space>
imap <leader>6 <Space><Space><Space><Space><Space><Space><Space>
imap <leader>7 <Space><Space><Space><Space><Space><Space><Space><Space>
imap <leader>8 <Space><Space><Space><Space><Space><Space><Space><Space><Space>

imap 10<Left> <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

imap 3<Tab> <Tab><Tab><Tab>
" imap Z <ESC>/'<CR>/'<CR>a
imap <leader><Tab> <ESC>:Tabularize<Space>/=><CR>

" Put all additional auto-corrects into autocorrect.vim in ~/.vim/plugin/autocorrect.vim
" Programming quality-of-life improvements
imap ( ()<ESC>i
imap [ []<ESC>i
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>, <ESC>A,
imap <leader><CR> <ESC>A<CR>#<Space>
nmap , A,<ESC>
cmap w!! w !sudo tee % >/dev/null
nmap <Tab> /'<CR>/'<CR>
nmap <leader><Space> :%s/\s\+$//<CR>
nnoremap ; :
"nnoremap qq :q!

" Spec test writing shortcuts

inoremap <leader>43 ''<Space>=><Space>'',<CR><Tab><Tab><Tab><Tab>''<Space>=><Space>'',<CR><Tab><Tab><Tab><Tab>''<Space>=><Space>'',<ESC><Up><Up>$hhhhhhhi

inoremap & <ESC>/''<Return>a

inoremap <leader>44 ''<Space>=><Space>'',<CR><Tab><Tab><Tab><Tab>''<Space>=><Space>'',<CR><Tab><Tab><Tab><Tab>''<Space>=><Space>'',<CR><Tab><Tab><Tab><Tab>''<Space>=><Space>'',<ESC><Up><Up><Up>$hhhhhhhi

inoremap -specm require<Space>'spec_helper'<CR><CR>describe<Space>''<Space>do<CR><Tab>context<Space>'Redhat<Space>OS<Space>Family'<Space>do<CR><Tab><Tab>let(:facts)<Space>{{<CR><Tab><Tab><Tab>'osfamily'<Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space>=><Space>'redhat',<CR><Tab><Tab><Tab>'operatingsystem'<Space><Space><Space><Space><Space><Space><Space><Space>=><Space>'centos',<CR><Tab><Tab><Tab>'pvdcvars'<Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space><Space>=><Space>{<CR><Tab><Tab><Tab><Tab>'artifactory_base_url'<Space>=><Space>'https://artifacts.pv.com',<CR><Tab><Tab><Tab><Tab>'artifactory_user'<Space><Space><Space><Space><Space>=><Space>'puppet',<CR><Tab><Tab><Tab><Tab>'artifactory_password'<Space>=><Space>'Art1fact0ry',<CR><Tab><Tab><Tab>},<CR><Tab><Tab>}}<CR><CR><Tab>end<CR>end<ESC>$:3<CR>/'<CR>a

imap <leader>shouldf <Tab><Tab>it<Space>do<CR><Tab><Tab><Tab>should<Space>contain_file('').with({<CR><Tab><Tab><Tab><Tab><CR><Tab><Tab><Tab>})<CR><Tab><Tab>end<ESC>$xx<Up><Up><Up>$?'<CR>i

imap <leader>shoulde <Tab><Tab>it<Space>do<CR><Tab><Tab><Tab>should<Space>contain_exec('').with({<CR><Tab><Tab><Tab><Tab><CR><Tab><Tab><Tab>})<CR><Tab><Tab>end<ESC>$xx<Up><Up><Up>$?'<CR>i

imap <leader>shouldp <Tab><Tab>it<Space>do<CR><Tab><Tab><Tab>should<Space>contain_package('').with({<CR><Tab><Tab><Tab><Tab><CR><Tab><Tab><Tab>})<CR><Tab><Tab>end<ESC>$xx<Up><Up><Up>$?'<CR>i

imap <leader>shoulds <Tab><Tab>it<Space>do<CR><Tab><Tab><Tab>should<Space>contain_service('').with({<CR><Tab><Tab><Tab><Tab><CR><Tab><Tab><Tab>})<CR><Tab><Tab>end<ESC>$xx<Up><Up><Up>$?'<CR>i

imap <leader>shoulda <Tab><Tab>it<Space>do<CR><Tab><Tab><Tab>should<Space>contain_pvops_artifactory__artifact('').with({<CR><CR><Tab><Tab><Tab>})<CR><Tab><Tab>end<ESC>$xx<Up><Up>a<Tab><Tab><Tab><Tab>-43<ESC>O<Tab><Tab><Tab><Tab>-43<ESC>O<Tab><Tab><Tab><Tab>-43ensureZpresentZurlZhttps://artifacts.pv.comZgavZZauthenticationZtrueZuserZpuppetZpwdZArt1fact0ryZpackagingZZrepositoryZpvopsZbeforeZ<Up><Up><Up><Up><Up><Up><Up><Up><Left><Left><Left><Left><Left>8<Space><Down>10<Left>8<Space><Space><Space><Space>10<Left><Left><Down>8<Space><Space><Space><Space><Down>10<Left><Down>8<Space><Space><Space>10<Left><Left><Down>8<Space><Space><Space><Space><Left><Left><Left><Left><Left><Down><Space><Space><Space><Space><Space><Left><Left><Left><Left><Left><Down><Space><Space><Space><Space>10<Left><Right><Right><Right><Down>8<Space><Up><Up><Up><Up><Up><Up><Right><Right><Right><Right>

" Programming efficiency for puppet
imap <leader>filev <Tab>file<Space>{<Space>"":<CR><Tab><Tab><CR><Tab>}<ESC><Up><Up>$<Left>i
imap <leader>file <Tab>file<Space>{<Space>'':<CR><Tab><Tab><CR><Tab>}<ESC><Up><Up>$<Left>i
imap <leader>exec <Tab>exec<Space>{<Space>'':<CR><Tab><Tab><CR><Tab>}<ESC><Up><Up>$<Left>i
imap <leader>packv <Tab>package<Space>{<Space>"":<CR><Tab><Tab><CR><Tab>}<ESC><Up><Up>llllllllllli
imap <leader>serv <Tab>service<Space>{<Space>'':<CR><Tab><Tab><CR><Tab>}<ESC><Up><Up>llllllllllli
imap <leader>pack <Tab>package<Space>{<Space>'':<CR><Tab><Tab><CR><Tab>}<ESC><Up><Up>llllllllllli
imap <leader>class class<Space><Space><Space>(<CR><CR>)<Space>{<CR><CR>}<ESC>$x<Up><Up><Up><Up>$<Left><Left>i
imap <leader>classart $artifactory_base_url<Space>=<Space>$pvdcvars['artifactory_base_url'],<ESC><Right>xo<Tab>$artifactory_user<Space>=<Space>$pvdcvars['artifactory_user'],<ESC><Right>xo<Tab>$artifactory_password<Space>=<Space>$pvdcvars['artifactory_password'],<ESC><Right>xo<CR><Tab>$package_repo<Space>=<Space>'pvops',<CR><Tab>$package_groupid<Space>=<Space>'',<CR><Tab>$package_artifactid<Space>=<Space>'',<CR><Tab>$package_type<Space>=<Space>'.tar.gz',<CR><Tab>$package_version<Space>=<Space>'',<Up><Up><Up><Left><Left>
imap <leader>classcm #<Space>==<Space>Class:<CR>#<CR>#<Space>This is what the module does<CR>#<CR>#<Space>===<Space>Paramaters:<CR>#<CR>#<Space>===<Space>Actions:<CR>#<CR>#<Space>===<Space>Requires:<CR>#<CR>#<Space>===<Space>Sample:<CR>#<CR>#<Space>class<Space>{<CR>#<Cr>#<Space>}<CR>
" These colors are examples of what is possible
" type :help syntax
" or :help color within vim for more info
" and try opening the file
" share/vim/vim61/syntax/colortest.vim
" Note: where share is depends on where/how you installed vim
 
highlight Comment       ctermfg=DarkGreen
highlight Constant      ctermfg=DarkMagenta
highlight Character     ctermfg=DarkRed
highlight Special       ctermfg=DarkBlue
highlight Identifier    ctermfg=DarkCyan
highlight Statement     ctermfg=DarkBlue
highlight PreProc       ctermfg=DarkBlue
highlight Type          ctermfg=DarkBlue
highlight Number        ctermfg=DarkBlue
highlight Delimiter     ctermfg=DarkBlue
highlight Error         ctermfg=Black
highlight Todo          ctermfg=DarkBlue
highlight WarningMsg    term=NONE           ctermfg=Black ctermbg=NONE   
highlight ErrorMsg      term=NONE           ctermfg=DarkRed ctermbg=NONE 

" These settings only affect the X11 GUI version (which is different
" than the fully Carbonized version at homepage.mac.com/fisherbb/

highlight Comment       guifg=Green                 gui=NONE
highlight Constant      guifg=Magenta               gui=NONE
highlight Character     guifg=Red                   gui=NONE
highlight Special       guifg=Blue                  gui=NONE
highlight Identifier    guifg=DarkCyan              gui=NONE
highlight Statement     guifg=DarkGreen             gui=NONE
highlight PreProc       guifg=Purple                gui=NONE
highlight Type          guifg=DarkGreen             gui=NONE
"highlight Normal                   guibg=#E0F2FF   gui=NONE
highlight Number        guifg=Blue                  gui=NONE
"highlight Cursor       guifg=NONE  guibg=Green
"highlight Cursor       guifg=bg    guibg=fg
highlight Delimiter     guifg=blue                  gui=NONE
"highlight NonText                  guibg=lightgray gui=NONE
"highlight Error        guifg=White guibg=Red       gui=NONE
highlight Error         guifg=NONE  guibg=NONE      gui=NONE
highlight Todo          guifg=Blue  guibg=Yellow    gui=NONE

"#### end color settings #############  
syntax on
set number
set expandtab
set tabstop=2
source ~/.vim/plugin/autocorrect.vim
execute pathogen#infect()
filetype plugin on
set omnifunc=syntaxcomplete#Complete
