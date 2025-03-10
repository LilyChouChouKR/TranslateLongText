FasdUAS 1.101.10   ��   ��    k             l     ��  ��    $  TranslateLongText.applescript     � 	 	 <   T r a n s l a t e L o n g T e x t . a p p l e s c r i p t   
  
 l     ��  ��    @ : Script to run the Long Text Translator Python application     �   t   S c r i p t   t o   r u n   t h e   L o n g   T e x t   T r a n s l a t o r   P y t h o n   a p p l i c a t i o n      l     ��������  ��  ��        l     ��  ��    H B Get the path to the script file itself using a different approach     �   �   G e t   t h e   p a t h   t o   t h e   s c r i p t   f i l e   i t s e l f   u s i n g   a   d i f f e r e n t   a p p r o a c h      i         I      �������� 0 getscriptpath getScriptPath��  ��    Q     �     k    �       l   ��   !��     ' ! Get the path to this script file    ! � " " B   G e t   t h e   p a t h   t o   t h i s   s c r i p t   f i l e   # $ # r     % & % n     ' ( ' 1   
 ��
�� 
psxp ( l   
 )���� ) c    
 * + * l    ,���� , I   �� -��
�� .earsffdralis        afdr -  f    ��  ��  ��   + m    	��
�� 
ctxt��  ��   & o      ���� 0 
scriptpath 
scriptPath $  . / . l   ��������  ��  ��   /  0 1 0 l   �� 2 3��   2 L F If it's an application, get its parent directory instead of Resources    3 � 4 4 �   I f   i t ' s   a n   a p p l i c a t i o n ,   g e t   i t s   p a r e n t   d i r e c t o r y   i n s t e a d   o f   R e s o u r c e s 1  5 6 5 Z    � 7 8�� 9 7 E     : ; : o    ���� 0 
scriptpath 
scriptPath ; m     < < � = =  . a p p / C o n t e n t s / 8 k    y > >  ? @ ? l   �� A B��   A ] W Extract the app's parent directory by removing everything after and including the .app    B � C C �   E x t r a c t   t h e   a p p ' s   p a r e n t   d i r e c t o r y   b y   r e m o v i n g   e v e r y t h i n g   a f t e r   a n d   i n c l u d i n g   t h e   . a p p @  D E D r      F G F I   ���� H
�� .sysooffslong    ��� null��   H �� I J
�� 
psof I m     K K � L L  . a p p J �� M��
�� 
psin M o    ���� 0 
scriptpath 
scriptPath��   G o      ���� 0 apppos appPos E  N�� N Z   ! y O P���� O ?   ! $ Q R Q o   ! "���� 0 apppos appPos R m   " #����   P k   ' u S S  T U T r   ' 6 V W V n   ' 4 X Y X 7  ( 4�� Z [
�� 
ctxt Z m   , .����  [ l  / 3 \���� \ \   / 3 ] ^ ] o   0 1���� 0 apppos appPos ^ m   1 2���� ��  ��   Y o   ' (���� 0 
scriptpath 
scriptPath W o      ���� 0 
scriptpath 
scriptPath U  _ ` _ l  7 7�� a b��   a &   Find the last slash before .app    b � c c @   F i n d   t h e   l a s t   s l a s h   b e f o r e   . a p p `  d e d r   7 : f g f m   7 8����   g o      ���� 0 	lastslash 	lastSlash e  h i h Y   ; ] j�� k l�� j Z   H X m n���� m =  H N o p o n   H L q r q 4   I L�� s
�� 
cha  s o   J K���� 0 i   r o   H I���� 0 
scriptpath 
scriptPath p m   L M t t � u u  / n r   Q T v w v o   Q R���� 0 i   w o      ���� 0 	lastslash 	lastSlash��  ��  �� 0 i   k m   > ?����  l n   ? C x y x 1   @ B��
�� 
leng y o   ? @���� 0 
scriptpath 
scriptPath��   i  z�� z Z   ^ u { |���� { ?   ^ a } ~ } o   ^ _���� 0 	lastslash 	lastSlash ~ m   _ `����   | r   d q  �  n   d o � � � 7  e o�� � �
�� 
ctxt � m   i k����  � o   l n���� 0 	lastslash 	lastSlash � o   d e���� 0 
scriptpath 
scriptPath � o      ���� 0 
scriptpath 
scriptPath��  ��  ��  ��  ��  ��  ��   9 k   | � � �  � � � l  | |�� � ���   � / ) If it's a script file, get its directory    � � � � R   I f   i t ' s   a   s c r i p t   f i l e ,   g e t   i t s   d i r e c t o r y �  � � � r   |  � � � m   | }����   � o      ���� 0 	lastslash 	lastSlash �  � � � Y   � � ��� � ��� � Z   � � � ����� � =  � � � � � n   � � � � � 4   � ��� �
�� 
cha  � o   � ����� 0 i   � o   � ����� 0 
scriptpath 
scriptPath � m   � � � � � � �  / � r   � � � � � o   � ����� 0 i   � o      ���� 0 	lastslash 	lastSlash��  ��  �� 0 i   � m   � �����  � n   � � � � � 1   � ���
�� 
leng � o   � ����� 0 
scriptpath 
scriptPath��   �  ��� � Z   � � � ����� � ?   � � � � � o   � ����� 0 	lastslash 	lastSlash � m   � �����   � r   � � � � � n   � � � � � 7  � ��� � �
�� 
ctxt � m   � �����  � o   � ����� 0 	lastslash 	lastSlash � o   � ����� 0 
scriptpath 
scriptPath � o      ���� 0 
scriptpath 
scriptPath��  ��  ��   6  � � � l  � ���������  ��  ��   �  ��� � L   � � � � o   � ����� 0 
scriptpath 
scriptPath��    R      �� ���
�� .ascrerr ****      � **** � o      ���� 0 errmsg errMsg��    k   � � � �  � � � l  � ��� � ���   � , & Alternative method if the above fails    � � � � L   A l t e r n a t i v e   m e t h o d   i f   t h e   a b o v e   f a i l s �  ��� � Q   � � � � � � k   � � � �  � � � l  � ��� � ���   � 0 * Try to get the desktop path as a fallback    � � � � T   T r y   t o   g e t   t h e   d e s k t o p   p a t h   a s   a   f a l l b a c k �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
psxp � l  � � ����� � I  � ��� ���
�� .earsffdralis        afdr � m   � ���
�� afdrdesk��  ��  ��   � o      ���� 0 desktoppath desktopPath �  ��� � L   � � � � o   � ����� 0 desktoppath desktopPath��   � R      ������
�� .ascrerr ****      � ****��  ��   � k   � � � �  � � � l  � ��� � ���   � * $ Last resort: use the home directory    � � � � H   L a s t   r e s o r t :   u s e   t h e   h o m e   d i r e c t o r y �  ��� � L   � � � � b   � � � � � b   � � � � � m   � � � � � � �  / U s e r s / � l  � � ����� � I  � ��� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � � �  w h o a m i��  ��  ��   � m   � � � � � � �  /��  ��     � � � l     �������  ��  �   �  � � � l     �~ � ��~   � G A Ask the user for the location of the translate_long_text.py file    � � � � �   A s k   t h e   u s e r   f o r   t h e   l o c a t i o n   o f   t h e   t r a n s l a t e _ l o n g _ t e x t . p y   f i l e �  � � � i     � � � I      �}�|�{�} $0 findpythonscript findPythonScript�|  �{   � k     � � �  � � � l     �z � ��z   � ) # First try to find it automatically    � � � � F   F i r s t   t r y   t o   f i n d   i t   a u t o m a t i c a l l y �  � � � Q     ~ � ��y � k    u � �  � � � l   �x � ��x   �   Get the script path    � � � � (   G e t   t h e   s c r i p t   p a t h �  � � � r    
 � � � I    �w�v�u�w 0 getscriptpath getScriptPath�v  �u   � o      �t�t 0 
scriptpath 
scriptPath �  � � � l   �s�r�q�s  �r  �q   �    l   �p�p   - ' Try to find in current directory first    � N   T r y   t o   f i n d   i n   c u r r e n t   d i r e c t o r y   f i r s t  r     b    	
	 b     m     � 
 f i n d   n     1    �o
�o 
strq o    �n�n 0 
scriptpath 
scriptPath
 m     � ~   - n a m e   ' t r a n s l a t e _ l o n g _ t e x t . p y '   - t y p e   f   2 > / d e v / n u l l   |   h e a d   - n   1 o      �m�m 0 findcommand findCommand  r     I   �l�k
�l .sysoexecTEXT���     TEXT o    �j�j 0 findcommand findCommand�k   o      �i�i 0 foundscript foundScript  l   �h�g�f�h  �g  �f    l   �e�e   ) # If not found, try parent directory    � F   I f   n o t   f o u n d ,   t r y   p a r e n t   d i r e c t o r y   Z    D!"�d�c! =    #$# o    �b�b 0 foundscript foundScript$ m    %% �&&  " k   # @'' ()( r   # .*+* I  # ,�a,�`
�a .sysoexecTEXT���     TEXT, b   # (-.- m   # $// �00  d i r n a m e  . n   $ '121 1   % '�_
�_ 
strq2 o   $ %�^�^ 0 
scriptpath 
scriptPath�`  + o      �]�] 0 	parentdir 	parentDir) 343 r   / 8565 b   / 6787 b   / 49:9 m   / 0;; �<< 
 f i n d  : n   0 3=>= 1   1 3�\
�\ 
strq> o   0 1�[�[ 0 	parentdir 	parentDir8 m   4 5?? �@@ ~   - n a m e   ' t r a n s l a t e _ l o n g _ t e x t . p y '   - t y p e   f   2 > / d e v / n u l l   |   h e a d   - n   16 o      �Z�Z 0 findcommand findCommand4 A�YA r   9 @BCB I  9 >�XD�W
�X .sysoexecTEXT���     TEXTD o   9 :�V�V 0 findcommand findCommand�W  C o      �U�U 0 foundscript foundScript�Y  �d  �c    EFE l  E E�T�S�R�T  �S  �R  F GHG l  E E�QIJ�Q  I . ( If not found, try user's home directory   J �KK P   I f   n o t   f o u n d ,   t r y   u s e r ' s   h o m e   d i r e c t o r yH LML Z   E hNO�P�ON =  E HPQP o   E F�N�N 0 foundscript foundScriptQ m   F GRR �SS  O k   K dTT UVU r   K RWXW I  K P�MY�L
�M .sysoexecTEXT���     TEXTY m   K LZZ �[[  e c h o   $ H O M E�L  X o      �K�K 0 homedir homeDirV \]\ r   S \^_^ b   S Z`a` b   S Xbcb m   S Tdd �ee 
 f i n d  c n   T Wfgf 1   U W�J
�J 
strqg o   T U�I�I 0 homedir homeDira m   X Yhh �ii � / D o c u m e n t s   - n a m e   ' t r a n s l a t e _ l o n g _ t e x t . p y '   - t y p e   f   2 > / d e v / n u l l   |   h e a d   - n   1_ o      �H�H 0 findcommand findCommand] j�Gj r   ] dklk I  ] b�Fm�E
�F .sysoexecTEXT���     TEXTm o   ] ^�D�D 0 findcommand findCommand�E  l o      �C�C 0 foundscript foundScript�G  �P  �O  M non l  i i�B�A�@�B  �A  �@  o pqp l  i i�?rs�?  r   If found, return it   s �tt (   I f   f o u n d ,   r e t u r n   i tq u�>u Z   i uvw�=�<v >  i lxyx o   i j�;�; 0 foundscript foundScripty m   j kzz �{{  w L   o q|| o   o p�:�: 0 foundscript foundScript�=  �<  �>   � R      �9�8�7
�9 .ascrerr ****      � ****�8  �7  �y   � }~} l   �6�5�4�6  �5  �4  ~ � l   �3���3  � 1 + If automatic detection fails, ask the user   � ��� V   I f   a u t o m a t i c   d e t e c t i o n   f a i l s ,   a s k   t h e   u s e r� ��� r    ���� I   ��2��
�2 .sysodlogaskr        TEXT� m    ��� ��� ` P l e a s e   l o c a t e   t h e   ' t r a n s l a t e _ l o n g _ t e x t . p y '   f i l e :� �1��
�1 
btns� J   � ��� ��� m   � ��� ���  C a n c e l� ��0� m   � ��� ���  B r o w s e . . .�0  � �/��
�/ 
dflt� m   � ��� ���  B r o w s e . . .� �.��-
�. 
disp� m   � ��,
�, stic   �-  � o      �+�+ 0 promptresult promptResult� ��� l  � ��*�)�(�*  �)  �(  � ��'� Z   � ����&�� =  � ���� n   � ���� 1   � ��%
�% 
bhit� o   � ��$�$ 0 promptresult promptResult� m   � ��� ���  B r o w s e . . .� k   � ��� ��� r   � ���� I  � ��#�"�
�# .sysostdfalis    ��� null�"  � �!��
�! 
prmp� m   � ��� ��� N S e l e c t   t h e   t r a n s l a t e _ l o n g _ t e x t . p y   f i l e :� � ��
�  
ftyp� J   � ��� ��� m   � ��� ���  p y�  �  � o      �� 0 
pythonfile 
pythonFile� ��� L   � ��� n   � ���� 1   � ��
� 
psxp� o   � ��� 0 
pythonfile 
pythonFile�  �&  � R   � ����
� .ascrerr ****      � ****� m   � ��� ��� 0 U s e r   c a n c e l l e d   o p e r a t i o n�  �'   � ��� l     ����  �  �  � ��� l     ����  �   Main script   � ���    M a i n   s c r i p t� ��� l   ����� Q    ����� k   ��� ��� l   ����  �   Find the Python script   � ��� .   F i n d   t h e   P y t h o n   s c r i p t� ��� r    
��� I    ���� $0 findpythonscript findPythonScript�  �  � o      �� 0 foundscript foundScript� ��� l   ��
�	�  �
  �	  � ��� l   ����  � 5 / Get the directory containing the Python script   � ��� ^   G e t   t h e   d i r e c t o r y   c o n t a i n i n g   t h e   P y t h o n   s c r i p t� ��� r    ��� I   ���
� .sysoexecTEXT���     TEXT� b    ��� m    �� ���  d i r n a m e  � n    ��� 1    �
� 
strq� o    �� 0 foundscript foundScript�  � o      �� 0 	scriptdir 	scriptDir� ��� l   ��� �  �  �   � ��� l   ������  � 2 , Define the command to run the Python script   � ��� X   D e f i n e   t h e   c o m m a n d   t o   r u n   t h e   P y t h o n   s c r i p t� ��� r    $��� b    "��� b    ��� b    ��� m    �� ���  c d  � n    ��� 1    ��
�� 
strq� o    ���� 0 	scriptdir 	scriptDir� m    �� ���    & &   p y t h o n 3  � n    !��� 1    !��
�� 
strq� o    ���� 0 foundscript foundScript� o      ���� 0 pythoncommand pythonCommand� ��� l  % %��������  ��  ��  �    l  % %����   / ) Check if required packages are installed    � R   C h e c k   i f   r e q u i r e d   p a c k a g e s   a r e   i n s t a l l e d  r   % ( m   % &		 �

 � p y t h o n 3   - c   ' i m p o r t   p y p e r c l i p '   2 > / d e v / n u l l   & &   e c h o   ' i n s t a l l e d '   | |   e c h o   ' n o t   i n s t a l l e d ' o      ����  0 checkpyperclip checkPyperclip  r   ) 0 l  ) .���� I  ) .����
�� .sysoexecTEXT���     TEXT o   ) *����  0 checkpyperclip checkPyperclip��  ��  ��   o      ���� (0 pyperclipinstalled pyperclipInstalled  l  1 1��������  ��  ��    Z   1 x���� =  1 4 o   1 2���� (0 pyperclipinstalled pyperclipInstalled m   2 3 �  n o t   i n s t a l l e d k   7 t  r   7 U I  7 Q�� !
�� .sysodlogaskr        TEXT  m   7 8"" �## � T h e   r e q u i r e d   P y t h o n   p a c k a g e   ' p y p e r c l i p '   i s   n o t   i n s t a l l e d .   W o u l d   y o u   l i k e   t o   i n s t a l l   i t   n o w ?! ��$%
�� 
btns$ J   9 ?&& '(' m   9 :)) �**  C a n c e l( +��+ m   : =,, �--  I n s t a l l��  % ��./
�� 
dflt. m   B E00 �11  I n s t a l l/ ��2��
�� 
disp2 m   H K��
�� stic   ��   o      ���� "0 installquestion installQuestion 343 l  V V��������  ��  ��  4 5��5 Z   V t67��86 =  V a9:9 n   V ];<; 1   Y ]��
�� 
bhit< o   V Y���� "0 installquestion installQuestion: m   ] `== �>>  I n s t a l l7 I  d k��?��
�� .sysoexecTEXT���     TEXT? m   d g@@ �AA Z p i p 3   i n s t a l l   p y p e r c l i p   r e q u e s t s   p y t h o n - d o t e n v��  ��  8 R   n t��B��
�� .ascrerr ****      � ****B m   p sCC �DD > R e q u i r e d   p a c k a g e s   n o t   i n s t a l l e d��  ��  ��  ��   EFE l  y y��������  ��  ��  F GHG l  y y��IJ��  I E ? Check if .env file exists, if not, create it from .env.example   J �KK ~   C h e c k   i f   . e n v   f i l e   e x i s t s ,   i f   n o t ,   c r e a t e   i t   f r o m   . e n v . e x a m p l eH LML r   y �NON b   y �PQP b   y �RSR m   y |TT �UU 
 [   - f  S n   | �VWV 1   � ���
�� 
strqW l  | �X����X b   | �YZY o   | }���� 0 	scriptdir 	scriptDirZ m   } �[[ �\\ 
 / . e n v��  ��  Q m   � �]] �^^ N   ]   & &   e c h o   ' e x i s t s '   | |   e c h o   ' n o t   f o u n d 'O o      ���� 0 checkenvfile checkEnvFileM _`_ r   � �aba l  � �c����c I  � ���d��
�� .sysoexecTEXT���     TEXTd o   � ����� 0 checkenvfile checkEnvFile��  ��  ��  b o      ���� 0 	envexists 	envExists` efe l  � ���������  ��  ��  f ghg Z   ��ij����i =  � �klk o   � ����� 0 	envexists 	envExistsl m   � �mm �nn  n o t   f o u n dj k   ��oo pqp r   � �rsr b   � �tut b   � �vwv m   � �xx �yy 
 [   - f  w n   � �z{z 1   � ���
�� 
strq{ l  � �|����| b   � �}~} o   � ����� 0 	scriptdir 	scriptDir~ m   � � ���  / . e n v . e x a m p l e��  ��  u m   � ��� ��� N   ]   & &   e c h o   ' e x i s t s '   | |   e c h o   ' n o t   f o u n d 's o      ���� "0 checkenvexample checkEnvExampleq ��� r   � ���� l  � ������� I  � ������
�� .sysoexecTEXT���     TEXT� o   � ����� "0 checkenvexample checkEnvExample��  ��  ��  � o      ���� $0 envexampleexists envExampleExists� ��� l  � ���������  ��  ��  � ���� Z   �������� =  � ���� o   � ����� $0 envexampleexists envExampleExists� m   � ��� ���  e x i s t s� k   �U�� ��� r   � ���� I  � �����
�� .sysodlogaskr        TEXT� m   � ��� ��� � N o   . e n v   f i l e   f o u n d .   W o u l d   y o u   l i k e   t o   c r e a t e   o n e   f r o m   . e n v . e x a m p l e ?� ����
�� 
btns� J   � ��� ��� m   � ��� ���  C a n c e l� ���� m   � ��� ���  C r e a t e��  � ����
�� 
dflt� m   � ��� ���  C r e a t e� �����
�� 
disp� m   � ���
�� stic   ��  � o      ���� 0 copyquestion copyQuestion� ��� l  � ���������  ��  ��  � ���� Z   �U������ =  � ���� n   � ���� 1   � ���
�� 
bhit� o   � ����� 0 copyquestion copyQuestion� m   � ��� ���  C r e a t e� k   �L�� ��� I  ������
�� .sysoexecTEXT���     TEXT� b   ���� b   ���� b   �	��� m   ��� ���  c p  � n  ��� 1  ��
�� 
strq� l ������ b  ��� o  ���� 0 	scriptdir 	scriptDir� m  �� ���  / . e n v . e x a m p l e��  ��  � m  	�� ���   � n  ��� 1  ��
�� 
strq� l ������ b  ��� o  ���� 0 	scriptdir 	scriptDir� m  �� ��� 
 / . e n v��  ��  ��  � ��� I 5����
�� .sysodlogaskr        TEXT� m  �� ��� � P l e a s e   e d i t   t h e   . e n v   f i l e   t o   a d d   y o u r   O p e n R o u t e r   A P I   k e y   b e f o r e   r u n n i n g   t h e   t r a n s l a t o r .� ����
�� 
btns� J  #�� ���� m  !�� ���  O K��  � ����
�� 
dflt� m  &)�� ���  O K� �����
�� 
disp� m  ,/��
�� stic   ��  � ��� I 6E�����
�� .sysoexecTEXT���     TEXT� b  6A��� m  69�� ���  o p e n   - e  � n  9@��� 1  >@��
�� 
strq� l 9>������ b  9>��� o  9:���� 0 	scriptdir 	scriptDir� m  :=�� ��� 
 / . e n v��  ��  ��  � ���� R  FL�����
�� .ascrerr ****      � ****� m  HK�� ��� | P l e a s e   r u n   t h e   a p p l i c a t i o n   a g a i n   a f t e r   s e t t i n g   u p   y o u r   A P I   k e y��  ��  ��  � R  OU�����
�� .ascrerr ****      � ****� m  QT�� ��� , N o   . e n v   f i l e   a v a i l a b l e��  ��  ��  � k  X��� ��� I Xy����
�� .sysodlogaskr        TEXT� b  Xa��� b  X]   m  X[ � \ E r r o r :   N e i t h e r   . e n v   n o r   . e n v . e x a m p l e   f o u n d   i n   o  [\���� 0 	scriptdir 	scriptDir� m  ]` �  .� ��
�� 
btns J  bg 	��	 m  be

 �  O K��   ��
�� 
dflt m  jm �  O K ��~
� 
disp m  ps�}
�} stic    �~  � �| R  z��{�z
�{ .ascrerr ****      � **** m  | � : C o n f i g u r a t i o n   f i l e s   n o t   f o u n d�z  �|  ��  ��  ��  h  l ���y�x�w�y  �x  �w    l ���v�v   "  Run the command in Terminal    � 8   R u n   t h e   c o m m a n d   i n   T e r m i n a l  O  �� k  ��   !"! I ���u�t�s
�u .miscactvnull��� ��� null�t  �s  " #$# l ���r%&�r  % 0 * Open a new terminal window if none exists   & �'' T   O p e n   a   n e w   t e r m i n a l   w i n d o w   i f   n o n e   e x i s t s$ ()( Z  ��*+�q,* = ��-.- l ��/�p�o/ I ���n0�m
�n .corecnte****       ****0 2 ���l
�l 
cwin�m  �p  �o  . m  ���k�k  + I ���j1�i
�j .coredoscnull��� ��� ctxt1 m  ��22 �33  �i  �q  , k  ��44 565 l ���h78�h  7   Use the current window   8 �99 .   U s e   t h e   c u r r e n t   w i n d o w6 :�g: I ���f;<
�f .coredoscnull��� ��� ctxt; m  ��== �>>  < �e?�d
�e 
kfil? 4 ���c@
�c 
cwin@ m  ���b�b �d  �g  ) ABA l ���a�`�_�a  �`  �_  B CDC l ���^EF�^  E   Run the Python script   F �GG ,   R u n   t h e   P y t h o n   s c r i p tD HIH I ���]JK
�] .coredoscnull��� ��� ctxtJ o  ���\�\ 0 pythoncommand pythonCommandK �[L�Z
�[ 
kfilL 4 ���YM
�Y 
cwinM m  ���X�X �Z  I NON l ���W�V�U�W  �V  �U  O PQP l ���TRS�T  R + % Set the title of the terminal window   S �TT J   S e t   t h e   t i t l e   o f   t h e   t e r m i n a l   w i n d o wQ U�SU r  ��VWV m  ��XX �YY ( L o n g   T e x t   T r a n s l a t o rW n      Z[Z 1  ���R
�R 
titl[ 4 ���Q\
�Q 
cwin\ m  ���P�P �S   m  ��]]�                                                                                      @ alis    J  Macintosh HD               �!�iBD ����Terminal.app                                                   �����!�i        ����  
 cu             	Utilities   -/:System:Applications:Utilities:Terminal.app/     T e r m i n a l . a p p    M a c i n t o s h   H D  *System/Applications/Utilities/Terminal.app  / ��   ^�O^ l ���N�M�L�N  �M  �L  �O  � R      �K_�J
�K .ascrerr ****      � ****_ o      �I�I 0 errmsg errMsg�J  � I ���H`a
�H .sysodlogaskr        TEXT` b  ��bcb m  ��dd �ee  E r r o r :  c o  ���G�G 0 errmsg errMsga �Ffg
�F 
btnsf J  ��hh i�Ei m  ��jj �kk  O K�E  g �Dlm
�D 
dfltl m  ��nn �oo  O Km �Cp�B
�C 
dispp m  ���A
�A stic    �B  �  �  �       �@qrst�@  q �?�>�=�? 0 getscriptpath getScriptPath�> $0 findpythonscript findPythonScript
�= .aevtoappnull  �   � ****r �< �;�:uv�9�< 0 getscriptpath getScriptPath�;  �:  u �8�7�6�5�4�3�8 0 
scriptpath 
scriptPath�7 0 apppos appPos�6 0 	lastslash 	lastSlash�5 0 i  �4 0 errmsg errMsg�3 0 desktoppath desktopPathv �2�1�0 <�/ K�.�-�,�+�* t ��)�(�'�& � ��% �
�2 .earsffdralis        afdr
�1 
ctxt
�0 
psxp
�/ 
psof
�. 
psin�- 
�, .sysooffslong    ��� null
�+ 
leng
�* 
cha �) 0 errmsg errMsg�(  
�' afdrdesk�&  
�% .sysoexecTEXT���     TEXT�9 � �)j  �&�,E�O�� i*���� E�O�j S�[�\[Zk\Z�k2E�OjE�O !k��,Ekh ��/�  �E�Y h[OY��O�j �[�\[Zk\Z�2E�Y hY hY @jE�O !k��,Ekh ��/�  �E�Y h[OY��O�j �[�\[Zk\Z�2E�Y hO�W .X   �j  �,E�O�W X  a a j %a %s �$ ��#�"wx�!�$ $0 findpythonscript findPythonScript�#  �"  w � �������  0 
scriptpath 
scriptPath� 0 findcommand findCommand� 0 foundscript foundScript� 0 	parentdir 	parentDir� 0 homedir homeDir� 0 promptresult promptResult� 0 
pythonfile 
pythonFilex $���%/;?RZdhz��������������������
�	�� 0 getscriptpath getScriptPath
� 
strq
� .sysoexecTEXT���     TEXT�  �  
� 
btns
� 
dflt
� 
disp
� stic   � 
� .sysodlogaskr        TEXT
� 
bhit
� 
prmp
� 
ftyp� 
�
 .sysostdfalis    ��� null
�	 
psxp�! � w*j+  E�O��,%�%E�O�j E�O��  "��,%j E�O��,%�%E�O�j E�Y hO��  �j E�O��,%�%E�O�j E�Y hO�� �Y hW X  hOa a a a lva a a a a  E�O�a ,a   $*a a a a kva   !E�O�a ",EY )ja #t �y��z{�
� .aevtoappnull  �   � ****y k    �|| ���  �  �  z �� 0 errmsg errMsg{ O���� ��������	����"��),��0������������=@CT[]����mx��������������������������
��]������2��=��X������djn� $0 findpythonscript findPythonScript� 0 foundscript foundScript
�  
strq
�� .sysoexecTEXT���     TEXT�� 0 	scriptdir 	scriptDir�� 0 pythoncommand pythonCommand��  0 checkpyperclip checkPyperclip�� (0 pyperclipinstalled pyperclipInstalled
�� 
btns
�� 
dflt
�� 
disp
�� stic   �� 
�� .sysodlogaskr        TEXT�� "0 installquestion installQuestion
�� 
bhit�� 0 checkenvfile checkEnvFile�� 0 	envexists 	envExists�� "0 checkenvexample checkEnvExample�� $0 envexampleexists envExampleExists�� 0 copyquestion copyQuestion
�� stic   
�� stic    
�� .miscactvnull��� ��� null
�� 
cwin
�� .corecnte****       ****
�� .coredoscnull��� ��� ctxt
�� 
kfil
�� 
titl�� 0 errmsg errMsg��  � �*j+  E�O���,%j E�O���,%�%��,%E�O�E�O�j E�O��  B���a lva a a a a  E` O_ a ,a   a j Y )ja Y hOa �a %�,%a %E` O_ j E`  O_  a !  �a "�a #%�,%a $%E` %O_ %j E` &O_ &a '  �a (�a )a *lva a +a a a  E` ,O_ ,a ,a -  Sa .�a /%�,%a 0%�a 1%�,%j Oa 2�a 3kva a 4a a 5a  Oa 6�a 7%�,%j O)ja 8Y )ja 9Y *a :�%a ;%�a <kva a =a a >a  O)ja ?Y hOa @ N*j AO*a B-j Cj  a Dj EY a Fa G*a Bk/l EO�a G*a Bk/l EOa H*a Bk/a I,FUOPW $X J Ka L�%�a Mkva a Na a >a  ascr  ��ޭ