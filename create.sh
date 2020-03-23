#create Auto head file
commit_id=`git rev-parse HEAD`
echo "#pragma once\n" > include/Auto_Head.h
echo "/*WARNING:this head file was created automatically by shell,please do not modify anything in this file!!!*/\n" >> include/Auto_Head.h
echo "#define COMMIT_ID \""$commit_id"\" \n" >> include/Auto_Head.h


make_binary(){
if [ ! -d "build/" ];then
	mkdir build/
fi

cd build
cmake .. #running Cmake
make #makefile
cd ..
}

clean_binary(){
if [ -d "build/" ];then
	rm -rf build/
fi
}
case $1 in
    'clean')  
		echo 'clean binary'
		clean_binary
    ;;
    'rebuild')  
		echo 'rebuild binary'
		clean_binary
		make_binary
    ;;
    'build')  
		echo 'start building binary'
		make_binary
    ;;
	'run')
		echo 'building binary...'
		make_binary
		./build/HelloWorld
	;;
    *)  
		echo 'start building binary'
		make_binary
    ;;
esac

