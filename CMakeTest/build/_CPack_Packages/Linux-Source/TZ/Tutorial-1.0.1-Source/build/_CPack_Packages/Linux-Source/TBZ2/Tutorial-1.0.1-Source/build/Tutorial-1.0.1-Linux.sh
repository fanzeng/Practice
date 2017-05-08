#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --prefix=dir      directory in which to install
  --include-subdir  include the Tutorial-1.0.1-Linux subdirectory
  --exclude-subdir  exclude the Tutorial-1.0.1-Linux subdirectory
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Tutorial Installer Version: 1.0.1, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage 
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version 
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
This is a test license file.

____cpack__here_doc____
    echo
    echo "Do you accept the license? [yN]: "
    read line leftover
    case ${line} in
      y* | Y*)
        cpack_license_accepted=TRUE;;
      *)
        echo "License not accepted. Exiting ..."
        exit 1;;
    esac
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Tutorial will be installed in:"
    echo "  \"${toplevel}/Tutorial-1.0.1-Linux\""
    echo "Do you want to include the subdirectory Tutorial-1.0.1-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Tutorial-1.0.1-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

tail $use_new_tail_syntax +143 "$0" | gunzip | (cd "${toplevel}" && tar xf -) || cpack_echo_exit "Problem unpacking the Tutorial-1.0.1-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;

� �TY �[{l[�?v^N�8N������8v�8.-`'ur��E��2��8�u��\���4�)�j��nC��4�UhҐ&�24h��j�&�[�c�
��Z�RE��s�w�{O����)_����;�w�w��|�;����J<��D.�����������sB��&o�np�<�FW���s���FĹ�(�����P��G�F/ w�|�c���Ѓ��V�ŒI[�-�����j��TEVǏ|�?�AkQ!N����o��P4�6������g��>���ׁ�/0|���*E���#�:��8���jԳ�^�Հ<�`�,�}������wQ������O*a��*�Ү��o�-��mX�]:9��B}��e��r�u���S�ƢRr�v���z�r�Y��� ٶ�~U��c�\��1@�o��ʿ>���d_����ٳ+�c�g�"�w�1eC�>^f��/ۗ��$�ʩ���u��7��*n�ˡ;�c/����V���ҟ}��#o��ݧ��z����v=��}/������Sg��O���'��0�J�ci}|U|w��_́��'ü�F=�!5M�� "}P�x�)��1��jg�-��i'�Ϫ��#Q�YZ�~՞r4����$�?��.��zC��P/k�� �i��� F�K�|��7��B�tzoVq;z��(��!�؋d%O*(��#(2��JJ	�Ȟ�㡨D�9)D�R	�}�BXL��QY}�-��$���c"�pH	a´Bpbt<.A����+�N(a\R7��QIH�bX_�+��e����n��m��dY�5kLmi�hon���F-cʹ���\�4��tI���S�^,������8%�M�W^��#B����5:<_��t��^~����_PP�!��#J��v��m�����mJW�����~�F�c$��\S�i�&�~jVM� ib�#j�M�&��z'�﷧^�ɧN���-���;BF"��ʎ�q<�S,x.R�o�����d��Ӌv>ur�up����s�/���\��)��u�G�<������e�m1���)�	+�W4��?u�m�^���ǚ�`C_)�C��f����7/`嚌	��/sxw�����S�b���蔌9)7�+u�Y>��������^~p�����?Wġ�a�t/��K�&HS���g�tV�y,��y}�p��{f�*6}�'ɞ��|X^<���|*�����?,w�Ϸa}�"��l ���_�$��d���K�R�I�ί!~?C���H�ȣ�Z�Σ��.�܅��?�R��@{�|��=�F���@�����o���-��yd����[����k��?��ǎ�������t�����t&y��;�	v��H�I�?���CۂgS���	9��갳:\���Шx�3�����(A}c"'�N�"���.�G����%��ᷬ��L�d^�}�N�#s��qK=������̟��G%d��Y&��+�l-E����,.s��Bsy�6�|��!vG��j[y���u����@���Dl�v�#֖�B�[�$-����f�>?�f���e}8_ݳ���Z�����v�@~�^�how=R��}�E�v���]{M��k�Wa�f�M��?�!\�~}[�e�_"�U�r �W ��2H���jH�{�ZH�=�*�_���Y:N�V�<��;
�t殓���"�1pz��~2R�,�:'���u��*���{)���n�(f���^�ȧ!M�s҅����&z�e�z8�{��`���ZZn�j������<N��S[�TS�����l�A���B�;���1W�o��-&&�S�+�3��^��F!5*%���(�qF�HM���1��pyWZ���vgH8/!�BD�&b
����8���	ޙ���t�8&D�qQ'�)MC%���}�5�P��GGp�qE}h�h%��:r����EI�2�G�Ct�f�(Zz#oa��!�;���#�Ϥ݌��
 .�O���x�S}:ߟ  8���;�.���̞
���� �E�O�� �R}��8�B��Pb�o'��2է�����ikC��@��-����=HkS�Oף�O�#����?����m���W��?���5Bt?������O1�X_���0��?��S?��'�ÖØT�z}��x1#���42�?���+6����C�~�ߧ��0�l��d�'@�+����G���?sy6Mδ�:}��W]��q���s��]��;H�;����jiꗥ�K��8�S?�[,�_�~��0��<A+�]D��O�i>��NV�ҿ ��Կ���g�i����P�o28{�@F�%�m��c�O��5 '�����8G���5~/S8[��(K��Ԉ[3�����F<?����~e�3��/2=��V��ř����d�y#����+2�_��p���g��FܑY��xEf=3�+3��Zf�1╙uň_ez��C_ϬF|Uv~�~p���8�+j�2}�f�j�R������?ȴ��# ���ݮ��� ;�����K�� ��1��H�_�/�s|��r��aVͫ@S��z�����(��\�����S��L���b2N*,Z9��n�h�q��/?���Ā�<ޓ���{���c�g1�?��bz�by.G9�Z��Io�� �w�7�?�Z��Ik���V�xU��<�䵚Ǚ���q�6���w���V�I(���D�#H���
���eCG�2.�����L Aǅ�X|8�J<!��$�wˉ���a�wSS������
��؋�[n89>���RB���
�V�929��H��*���Π��J�X��wC!$f���XH
����;���-F1��l���ut7:������>�/��.+�����~}�K�#a>c&��i%��?FV҃`!+��|�E��>-�xY1?�@G%��)c�IiD��%�2ȟ�\.������W���������ݴ���/���J���RR�������=�&�s����q��"7M��Ѝi�������6����4P���zH~S=-��M�~�����,�gۥa:��+L�+�r��(wl��ܨ��,�t!��Ԝ�:�!�HRס�m��ţw�.P�x(�q��1�uv�����M��
B�E�p���7w=b��@R{��oDƻ��껑��t��|����zRg�Y��7��D�L�G�vdn�!�|�z�y�2�?Z��|s��m�R}���H�;R�I�9}`�*�T�@�;
B���7�D���9�8�{_��@�^+uvf��<�[��9���ꓴF�_�i5)*�Ēa��x ��u\���ry����nh�֓�_�k���_
�;�p�\��TT�H*�XR�as���X��.��O�HK\�DG��p��_�m����455���u5-��/���8eL�F�nO&�0�P� .$�9YT��4*s�x��C�亰�Jb���ۻ������^�}��.,���o
�wt������uI	�
�m��:��!��іi��i���?,} :  