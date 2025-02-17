#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���bmisaka.sh �V_OG�O�]��U9ƴ�4D��"QR%�Dy8�����[�n��PW�bŴ�)J	�
�I���;|����н;����c��nv�7�3��ٞ���	!шqܭ�k��`p2P!7zkdd���g��������5A��z���×]E�z��t��#0�&H�a�#Ѐ��T_�f �4�Eu��nF�]�RHQp��U���� Q��Ͱ��{@��fY"�`c]wu1*��GZX�������7�.�aZ�}�nҕ��֭��W�!N�`�����Vy�ndN�c�č!A�I�W]/~��v�n<�D��Q���c�f�z��	L�*��5D$�<�� �w$����h�..��7�=s!_-�A�b �3�B��mm�a�/�>8y��zZ0�i�h�T�wwh~��:��Ϳ1�in���T�*�vq��%��7���G������[km��{Ekff�1À�� ��E���܄��&��Ƨ�A
�89&'����?8�)��� $�4������EY�&40-�u������z*h)Cw�<��~�.&�� ~�Q4]L��2�%B	����U�z�)8*��T� HjN],)��0��hV���U�.��ʅ;wn\��rtg���wOEsO�Jy�89Z��,u�Ң��DB�p^>����Z�������q0�	���g���A���0��y�S)88��?"{��\�2r�:�ڒ?�� ;3��[]���0-L��&kQ/��Y�Z'���6L6�N�=q��p��mI�K�şQ�a��"�95Z�j�J�����Yf�n�aǧ�]x�t�v��3�0��T��Xs�4��V�t�yk������H��n��RK���e���;��K��_��\�)l��ק� �j	c��g��c�8�����"rt�麃KW�0�����K��������ǡ����-WKs��f]�۶�7OV�v��)v�������l�Zzx�]b�g=/���]~��L�=�ǌ_ZGO<6L�˥r�'�.ٯ��r���k��ؖ�%'��cs?�����X5����=�� ����/�w
  