FasdUAS 1.101.10   ��   ��    k             l     ����  r       	  J     ����   	 o      ���� 0 listtoclose listToClose��  ��     
  
 l    ����  r        n        2   ��
�� 
cpar  l    ����  I   �� ��
�� .rdwrread****        ****  4    	�� 
�� 
psxf  m       �   : / U s e r s / p a u l j o h n s o n / . b l o c k l i s t��  ��  ��    o      ���� 0 listtoclose listToClose��  ��        l    ����  r        J    ����    o      ���� 
0 closed  ��  ��        l     ��������  ��  ��        l     ��������  ��  ��         l      �� ! "��   !,&tell application "Safari"	set windowList to every window	repeat with theWindow in windowList		set tabList to every tab in theWindow		set tabList to reverse of tabList		repeat with t in tabList			set tabURL to URL of t			repeat with blockedURL in listToClose				if contents of blockedURL is not "" and tabURL contains (contents of blockedURL) and tabURL is not in closed then					# log tabURL					# log t					# log blockedURL					tell t to close					set end of closed to tabURL				end if			end repeat		end repeat	end repeatend tell    " � # #L  t e l l   a p p l i c a t i o n   " S a f a r i "  	 s e t   w i n d o w L i s t   t o   e v e r y   w i n d o w  	 r e p e a t   w i t h   t h e W i n d o w   i n   w i n d o w L i s t  	 	 s e t   t a b L i s t   t o   e v e r y   t a b   i n   t h e W i n d o w  	 	 s e t   t a b L i s t   t o   r e v e r s e   o f   t a b L i s t  	 	 r e p e a t   w i t h   t   i n   t a b L i s t  	 	 	 s e t   t a b U R L   t o   U R L   o f   t  	 	 	 r e p e a t   w i t h   b l o c k e d U R L   i n   l i s t T o C l o s e  	 	 	 	 i f   c o n t e n t s   o f   b l o c k e d U R L   i s   n o t   " "   a n d   t a b U R L   c o n t a i n s   ( c o n t e n t s   o f   b l o c k e d U R L )   a n d   t a b U R L   i s   n o t   i n   c l o s e d   t h e n  	 	 	 	 	 #   l o g   t a b U R L  	 	 	 	 	 #   l o g   t  	 	 	 	 	 #   l o g   b l o c k e d U R L  	 	 	 	 	 t e l l   t   t o   c l o s e  	 	 	 	 	 s e t   e n d   o f   c l o s e d   t o   t a b U R L  	 	 	 	 e n d   i f  	 	 	 e n d   r e p e a t  	 	 e n d   r e p e a t  	 e n d   r e p e a t  e n d   t e l l     $ % $ l     ��������  ��  ��   %  & ' & l     ��������  ��  ��   '  (�� ( l   � )���� ) O    � * + * k    � , ,  - . - r      / 0 / 2    ��
�� 
cwin 0 o      ���� 0 
windowlist 
windowList .  1�� 1 X   ! � 2�� 3 2 k   1 � 4 4  5 6 5 r   1 6 7 8 7 n  1 4 9 : 9 2   2 4��
�� 
CrTb : o   1 2���� 0 	thewindow 	theWindow 8 o      ���� 0 tablist tabList 6  ; < ; r   7 < = > = n   7 : ? @ ? 1   8 :��
�� 
rvse @ o   7 8���� 0 tablist tabList > o      ���� 0 tablist tabList <  A�� A X   = � B�� C B k   M � D D  E F E r   M T G H G n   M P I J I 1   N P��
�� 
URL  J o   M N���� 0 t   H o      ���� 0 taburl tabURL F  K�� K X   U � L�� M L Z   e � N O���� N F   e � P Q P F   e ~ R S R >  e n T U T n   e j V W V 1   f j��
�� 
pcnt W o   e f���� 0 
blockedurl 
blockedURL U m   j m X X � Y Y   S E   q z Z [ Z o   q t���� 0 taburl tabURL [ l  t y \���� \ n   t y ] ^ ] 1   u y��
�� 
pcnt ^ o   t u���� 0 
blockedurl 
blockedURL��  ��   Q H   � � _ _ E  � � ` a ` o   � ����� 
0 closed   a o   � ����� 0 taburl tabURL O k   � � b b  c d c O  � � e f e I  � �������
�� .coreclosnull���     obj ��  ��   f o   � ����� 0 t   d  g�� g r   � � h i h o   � ����� 0 taburl tabURL i n       j k j  ;   � � k o   � ����� 
0 closed  ��  ��  ��  �� 0 
blockedurl 
blockedURL M o   X Y���� 0 listtoclose listToClose��  �� 0 t   C o   @ A���� 0 tablist tabList��  �� 0 	thewindow 	theWindow 3 o   $ %���� 0 
windowlist 
windowList��   + m     l l�                                                                                  rimZ  alis    >  Macintosh HD               �	�iBD ����Google Chrome.app                                              ����ީ�K        ����  
 cu             Applications  !/:Applications:Google Chrome.app/   $  G o o g l e   C h r o m e . a p p    M a c i n t o s h   H D  Applications/Google Chrome.app  / ��  ��  ��  ��       
�� m n o p q r s������   m ����������������
�� .aevtoappnull  �   � ****�� 0 listtoclose listToClose�� 
0 closed  �� 0 
windowlist 
windowList�� 0 tablist tabList�� 0 taburl tabURL��  ��   n �� t���� u v��
�� .aevtoappnull  �   � **** t k     � w w   x x  
 y y   z z  (����  ��  ��   u �������� 0 	thewindow 	theWindow�� 0 t  �� 0 
blockedurl 
blockedURL v ���� ������ l���������������������� X������ 0 listtoclose listToClose
�� 
psxf
�� .rdwrread****        ****
�� 
cpar�� 
0 closed  
�� 
cwin�� 0 
windowlist 
windowList
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
CrTb�� 0 tablist tabList
�� 
rvse
�� 
URL �� 0 taburl tabURL
�� 
pcnt
�� 
bool
�� .coreclosnull���     obj �� �jvE�O)��/j �-E�OjvE�O� �*�-E�O ��[��l kh  ��-E�O��,E�O o�[��l kh ��,E` O R�[��l kh �a ,a 	 _ �a ,a &	 �_ a & � *j UO_ �6FY h[OY��[OY��[OY�~U o �� {�� = { @  | } ~  � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � ������� | � � �  w w w . r e d d i t . c o m } � � �  r i b b o n f a r m . c o m ~ � � �  t w i t t e r . c o m  � � �  w w w . t w i t t e r . c o m � � � �  a p i . t w i t t e r . c o m � � � � $ m o b i l e . t w i t t e r . c o m � � � �  u n z . c o m � � � � , w w w . n a t i o n a l r e v i e w . c o m � � � � $ n a t i o n a l r e v i e w . c o m � � � �  r e d d i t . c o m � � � �  n p . r e d d i t . c o m � � � �  s a l o n . c o m � � � �  w w w . s a l o n . c o m � � � �  m e t a f i l t e r . c o m � � � �  t h e a t l a n t i c . c o m � � � � & w w w . t h e a t l a n t i c . c o m � � � � ( n e w s . y c o m b i n a t o r . c o m � � � �  p r o s p e c t . o r g � � � �  a r s t e c h n i c a . c o m � � � � " w w w . p i t c h f o r k . c o m � � � �  p i t c h f o r k . c o m � � � �  e c o n o m i s t . c o m � � � � " w w w . e c o n o m i s t . c o m � � � �  w w w . s t u f f . c o . n z � � � �  s t u f f . c o . n z � � � � 6 t h e a m e r i c a n c o n s e r v a t i v e . c o m � � � � > w w w . t h e a m e r i c a n c o n s e r v a t i v e . c o m � � � �  f a c e b o o k . c o m � � � �   w w w . f a c e b o o k . c o m � � � �  n y t i m e s . c o m � � � � , m a r g i n a l r e v o l u t i o n . c o m � � � �  f e e d l y . c o m � � � �  t e c h c r u n c h . c o m � � � � $ s l a t e s t a r c o d e x . c o m � � � � 4 a m e r i c a n a f f a i r s j o u r n a l . o r g � � � �  q u i l l e t t e . c o m � � � �  j a c o b i t e m a g . c o m � � � � * g r e y e n l i g h t e n m e n t . c o m � � � �  n y t i m e s . c o m � � � �  w w w . n y t i m e s . c o m � � � � ( w o r l d o f s o l i t a i r e . c o m � � � �  y o u t u b e . c o m � � � �  w w w . y o u t u b e . c o m � � � � 6 s c h o l a r s - s t a g e . b l o g s p o t . c o m � � � �  o l d . r e d d i t . c o m � � � �  d a m a g e m a g . c o m � � � �  u n h e r d . c o m � � � �   p a l l a d i u m m a g . c o m � � � �  s a m k r i s s . c o m � � � �  n z h e r a l d . c o . n z � � � � $ w w w . n z h e r a l d . c o . n z � � � �  c n n . c o m � � � �  b b c . c o m � � � �  w w w . b b c . c o m � � � �  t h e g u a r d i a n . c o m � � � � & w w w . t h e g u a r d i a n . c o m � � � �  e d i t i o n . c n n . c o m � � � �  i n s t a g r a m . c o m � � � �  s l o w b o r i n g . c o m � � � � . n o a h p i n i o n . s u b s t a c k . c o m � � � �  ��  ��  ��   p �� ���  �   ������������������������������ � � � � 0 h t t p s : / / t w i t t e r . c o m / h o m e��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �   q �~ ��~  �   � � � � � �  � �  l�}�|�{
�} 
cwin�| 歮
�{ kfrmID   �     l�z�y�x
�z 
cwin�y �L
�x kfrmID   �   l�w�v�u
�w 
cwin�v ��
�u kfrmID   �   l�t�s�r
�t 
cwin�s �\
�r kfrmID   �   l�q�p�o
�q 
cwin�p �_
�o kfrmID   r �n�n   	 

 �m�l�k  l�j�i�h
�j 
cwin�i �_
�h kfrmID  
�m 
CrTb�l �J
�k kfrmID    �g�f�e  l�d�c�b
�d 
cwin�c �_
�b kfrmID  
�g 
CrTb�f �I
�e kfrmID    �a�`�_  l�^�]�\
�^ 
cwin�] �_
�\ kfrmID  
�a 
CrTb�` �H
�_ kfrmID    �[�Z�Y  l�X�W�V
�X 
cwin�W �_
�V kfrmID  
�[ 
CrTb�Z �G
�Y kfrmID  	  �U�T�S  l�R�Q�P
�R 
cwin�Q �_
�P kfrmID  
�U 
CrTb�T �F
�S kfrmID   s �� h t t p s : / / i d . t r i m b l e . c o m / u i / s i g n _ i n . h t m l ? s t a t e = e y J 0 e X A i O i J K V 1 Q i L C J h b G c i O i J S U z I 1 N i I s I m t p Z C I 6 I j E i f Q . e y J v Y X V 0 a F 9 w Y X J h b W V 0 Z X J z I j p 7 I m N s a W V u d F 9 p Z C I 6 I m M 5 M T N h O T B j L T R k Y 2 Y t N G F m Y i 1 i M 2 R i L T Y z N 2 J l M z c 3 N D Z i Z i I s I n J l Z G l y Z W N 0 X 3 V y a S I 6 I m h 0 d H B z O i 8 v b G 9 n a W 4 u c 2 t l d G N o d X A u Y 2 9 t L 2 x v Z 2 l u L 3 R y a W 1 i b G V p Z C 9 j Y W x s Y m F j a y I s I n J l c 3 B v b n N l X 3 R 5 c G U i O i J j b 2 R l I i w i c 2 N v c G U i O i J v c G V u a W Q g c 2 t l d G N o d X A t b G 9 n a W 4 t c H J v Z C 1 W M i I s I n N 0 Y X R l I j o i U V h W M G F F d G x l U 0 E z W k d V e E 1 H W X h N a T A w T m p R N U x U U X p Z V E l 0 T 0 d F N F l p M H p N V E 5 t T W p O a F l t S T B N M l F f I n 0 s I m V 4 d H J h X 3 B h c m F t Z X R l c n M i O n s i b G F u Z y I 6 I m V u I n 0 s I m l u d G V y b m F s X 3 B h c m F t Z X R l c n M i O n t 9 f Q . n y I 0 n c 7 q B Q P v t d I P v U e Z V H R g 7 Y 1 5 B c e p I u 7 Z 8 C z e M 4 I 6 D I D R H Y 5 l z B - 8 Z p v m a j K L K - - t j 3 8 p J r M T g C R 7 q M 8 v p p a W E x t M T 2 T g I b t h U q S i Z K X A 0 b i c j u o n s F a K A P Y 4 E M y Q J 0 3 7 k Z e p f Y x _ I 7 8 Z z P d l A 5 r 8 N n b Q B B w 5 7 f J 5 u 0 3 N p r h G Q F Z t _ y V C 3 5 - M 1 d v r c r g T j p 5 n M V X y V p p r E G f x L 5 R o L l J V J N k s B 4 z 3 n O S k p y c K f O J x X q i V z N _ Z G H L C 3 j 1 d H M F M 7 U S F F 1 x X p W _ P 4 C q Q f I r H u m S 9 h a P Q O A 6 m s A g p r h Q G D r 5 I D k N G x p o W F F h m Y 2 w s B L h t 8 R d M 5 S j W d K c 5 K 5 Z 6 B v Z 1 K w��  ��   ascr  ��ޭ