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
windowList��   + m     l l�                                                                                  rimZ  alis    >  Macintosh HD               �\CBD ����Google Chrome.app                                              ����ީ�K        ����  
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
�� .coreclosnull���     obj �� �jvE�O)��/j �-E�OjvE�O� �*�-E�O ��[��l kh  ��-E�O��,E�O o�[��l kh ��,E` O R�[��l kh �a ,a 	 _ �a ,a &	 �_ a & � *j UO_ �6FY h[OY��[OY��[OY�~U o �� {�� A { P  | } ~  � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � ������������������������������� | � � �  w w w . r e d d i t . c o m } � � �  r i b b o n f a r m . c o m ~ � � �  t w i t t e r . c o m  � � �  w w w . t w i t t e r . c o m � � � �  a p i . t w i t t e r . c o m � � � � $ m o b i l e . t w i t t e r . c o m � � � � 
 x . c o m � � � �  w w w . x . c o m � � � �  a p i . x . c o m � � � �  m o b i l e . x . c o m � � � �  u n z . c o m � � � � , w w w . n a t i o n a l r e v i e w . c o m � � � � $ n a t i o n a l r e v i e w . c o m � � � �  r e d d i t . c o m � � � �  n p . r e d d i t . c o m � � � �  s a l o n . c o m � � � �  w w w . s a l o n . c o m � � � �  m e t a f i l t e r . c o m � � � �  t h e a t l a n t i c . c o m � � � � & w w w . t h e a t l a n t i c . c o m � � � � ( n e w s . y c o m b i n a t o r . c o m � � � �  p r o s p e c t . o r g � � � �  a r s t e c h n i c a . c o m � � � � " w w w . p i t c h f o r k . c o m � � � �  p i t c h f o r k . c o m � � � �  e c o n o m i s t . c o m � � � � " w w w . e c o n o m i s t . c o m � � � �  w w w . s t u f f . c o . n z � � � �  s t u f f . c o . n z � � � � 6 t h e a m e r i c a n c o n s e r v a t i v e . c o m � � � � > w w w . t h e a m e r i c a n c o n s e r v a t i v e . c o m � � � �  f a c e b o o k . c o m � � � �   w w w . f a c e b o o k . c o m � � � �  n y t i m e s . c o m � � � � , m a r g i n a l r e v o l u t i o n . c o m � � � �  f e e d l y . c o m � � � �  t e c h c r u n c h . c o m � � � � $ s l a t e s t a r c o d e x . c o m � � � � 4 a m e r i c a n a f f a i r s j o u r n a l . o r g � � � �  q u i l l e t t e . c o m � � � �  j a c o b i t e m a g . c o m � � � � * g r e y e n l i g h t e n m e n t . c o m � � � �  n y t i m e s . c o m � � � �  w w w . n y t i m e s . c o m � � � � ( w o r l d o f s o l i t a i r e . c o m � � � �  y o u t u b e . c o m � � � �  w w w . y o u t u b e . c o m � � � � 6 s c h o l a r s - s t a g e . b l o g s p o t . c o m � � � �  o l d . r e d d i t . c o m � � � �  d a m a g e m a g . c o m � � � �  u n h e r d . c o m � � � �   p a l l a d i u m m a g . c o m � � � �  s a m k r i s s . c o m � � � �  n z h e r a l d . c o . n z � � � � $ w w w . n z h e r a l d . c o . n z � � � �  c n n . c o m � � � �  b b c . c o m � � � �  w w w . b b c . c o m � � � �  t h e g u a r d i a n . c o m � � � � & w w w . t h e g u a r d i a n . c o m � � � �  e d i t i o n . c n n . c o m � � � �  i n s t a g r a m . c o m � � � �  s l o w b o r i n g . c o m � � � � . n o a h p i n i o n . s u b s t a c k . c o m � � � �  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��   p �� ���  �   �������~�}�|�{�z�y�x�w�v�u�t�s � �   h h t t p s : / / x . c o m / k o z e r a f i l i p / s t a t u s / 1 8 5 9 5 9 7 6 4 1 6 9 8 6 8 0 9 1 4��  ��  �  �~  �}  �|  �{  �z  �y  �x  �w  �v  �u  �t  �s   q �r�r      l�q�p
�q 
cwin �  1 4 9 4 3 5 0 8 5
�p kfrmID   		  l�o
�n
�o 
cwin
 �  1 4 9 4 3 4 9 1 0
�n kfrmID     l�m�l
�m 
cwin �  1 4 9 4 3 4 9 3 3
�l kfrmID     l�k�j
�k 
cwin �  1 4 9 4 3 4 8 6 6
�j kfrmID   r �i�i     !! "�h#�g"  l�f$�e
�f 
cwin$ �%%  1 4 9 4 3 4 8 6 6
�e kfrmID  
�h 
CrTb# �&&  1 4 9 4 3 4 9 0 7
�g kfrmID   '' (�d)�c(  l�b*�a
�b 
cwin* �++  1 4 9 4 3 4 8 6 6
�a kfrmID  
�d 
CrTb) �,,  1 4 9 4 3 4 9 0 4
�c kfrmID   -- .�`/�_.  l�^0�]
�^ 
cwin0 �11  1 4 9 4 3 4 8 6 6
�] kfrmID  
�` 
CrTb/ �22  1 4 9 4 3 5 0 4 6
�_ kfrmID   33 4�\5�[4  l�Z6�Y
�Z 
cwin6 �77  1 4 9 4 3 4 8 6 6
�Y kfrmID  
�\ 
CrTb5 �88  1 4 9 4 3 4 8 9 8
�[ kfrmID   99 :�X;�W:  l�V<�U
�V 
cwin< �==  1 4 9 4 3 4 8 6 6
�U kfrmID  
�X 
CrTb; �>>  1 4 9 4 3 5 0 4 3
�W kfrmID   ?? @�TA�S@  l�RB�Q
�R 
cwinB �CC  1 4 9 4 3 4 8 6 6
�Q kfrmID  
�T 
CrTbA �DD  1 4 9 4 3 5 0 4 0
�S kfrmID   EE F�PG�OF  l�NH�M
�N 
cwinH �II  1 4 9 4 3 4 8 6 6
�M kfrmID  
�P 
CrTbG �JJ  1 4 9 4 3 5 0 3 7
�O kfrmID   KK L�LM�KL  l�JN�I
�J 
cwinN �OO  1 4 9 4 3 4 8 6 6
�I kfrmID  
�L 
CrTbM �PP  1 4 9 4 3 4 8 8 6
�K kfrmID   QQ R�HS�GR  l�FT�E
�F 
cwinT �UU  1 4 9 4 3 4 8 6 6
�E kfrmID  
�H 
CrTbS �VV  1 4 9 4 3 4 8 8 3
�G kfrmID   WW X�DY�CX  l�BZ�A
�B 
cwinZ �[[  1 4 9 4 3 4 8 6 6
�A kfrmID  
�D 
CrTbY �\\  1 4 9 4 3 4 8 8 0
�C kfrmID   ]] ^�@_�?^  l�>`�=
�> 
cwin` �aa  1 4 9 4 3 4 8 6 6
�= kfrmID  
�@ 
CrTb_ �bb  1 4 9 4 3 4 8 7 7
�? kfrmID   cc d�<e�;d  l�:f�9
�: 
cwinf �gg  1 4 9 4 3 4 8 6 6
�9 kfrmID  
�< 
CrTbe �hh  1 4 9 4 3 4 8 7 4
�; kfrmID   ii j�8k�7j  l�6l�5
�6 
cwinl �mm  1 4 9 4 3 4 8 6 6
�5 kfrmID  
�8 
CrTbk �nn  1 4 9 4 3 5 0 3 4
�7 kfrmID    oo p�4q�3p  l�2r�1
�2 
cwinr �ss  1 4 9 4 3 4 8 6 6
�1 kfrmID  
�4 
CrTbq �tt  1 4 9 4 3 4 8 6 7
�3 kfrmID   s �uu � h t t p s : / / w w w . h a m m e r s p o o n . o r g / d o c s / h s . h t t p s e r v e r . h s m i n w e b . h t m l # p o r t��  ��  ascr  ��ޭ