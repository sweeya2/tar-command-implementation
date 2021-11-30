#!/bin/bash

read -a arr

declare -i c=0
declare -i x=0
declare -i r=0
declare -i t=0

random="i5SRdUIavRwyTpMA"

#checks if random input is given
length=${#arr[1]}
if [ $length -gt 3 ]; then
    echo "please change input"
else
    if [ ${arr[0]} != "tar" ]; then
        echo "takes only tar commands"
    else
        #checks if the following letter is present
        if [[ "${arr[1]}" == *"c"* ]]; then
            c=1
        elif [[ "${arr[1]}" == *"x"* ]]; then
            x=1
        elif [[ "${arr[1]}" == *"r"* ]]; then
            r=1
        elif [[ "${arr[1]}" == *"t"* ]]; then
            t=1
        else 
            echo "please change input"
        fi
        #creates archive
        if [ $c -eq 1 ]; then
            #search if f is there
            if [[ "${arr[1]}" == *"f"* ]]; then
                #delimiters are used to seperate contents of a the file
                if [[ $length -eq 2 || "${arr[1]}" == *"v"* ]]; then
                    echo $random > ${arr[2]}
                    declare -i temp=0
                    declare -i number=0     #this stores the number of files
                    #file content is sent to the tar file
                    for elem in ${arr[@]}
                    do 
                        if [ $temp -gt 2 ]; then
                            vars=$(ls -l | egrep $elem)
                            sed -i -e '1 i'"$vars"'\' ${arr[2]}    #sending ls -l to the first line of the file
                            echo $elem >> ${arr[2]}
                            cat $elem >> ${arr[2]}     #sending content of the files to the archived file 
                            echo \ >> ${arr[2]}
                            echo $random >> ${arr[2]}     #string delimiter to seperate files while extraction
                            let number=number+1
                        else 
                            let temp=temp+1
                        fi
                    done
                else
                    echo "please change input"
                fi
                #displays verbose information
                if [[ "${arr[1]}" == *"v"* ]]; then
                    declare -i temp1=0
                    for elem in ${arr[@]}
                    do 
                        if [ $temp1 -gt 2 ]; then
                            echo $elem
                            let temp1=temp1+1
                        else 
                            let temp1=temp1+1
                        fi
                    done
                fi
            else
                echo "wrong input"
            fi
        #appends files in your tar 
        elif [ $r -eq 1 ]; then
            if [[ "${arr[1]}" == *"f"* ]]; then
                if [[ $length -eq 2 || "${arr[1]}" == *"v"* ]]; then
                    declare -i temp=0
                    declare -i number=0
                    #file content is sent to the tar file
                    for elem in ${arr[@]}
                    do 
                        if [ $temp -gt 2 ]; then
                            vars=$(ls -l | egrep $elem)
                            sed -i -e '1 i'"$vars"'\' ${arr[2]}  #sending ls -l to the first line of the file
                            echo $elem >> ${arr[2]}
                            cat $elem >> ${arr[2]}     #sending content of the files to the archived file
                            echo \ >> ${arr[2]}
                            echo $random >> ${arr[2]}     #string delimiter to seperate files while extraction
                            let number=number+1
                        else 
                            let temp=temp+1
                        fi
                    done
                else
                    echo "please change input"
                fi
                #displays verbose information
                if [[ "${arr[1]}" == *"v"* ]]; then
                    declare -i temp1=0
                    for elem in ${arr[@]}
                    do 
                        if [ $temp1 -gt 2 ]; then
                            echo $elem
                            let temp1=temp1+1
                        else 
                            let temp1=temp1+1
                        fi
                    done
                fi
            else
                echo "wrong input"
            fi
        #extracts the archive
        elif [ $x -eq 1 ]; then
            if [[ "${arr[1]}" == *"f"* ]]; then
                if [[ $length -eq 2 || "${arr[1]}" == *"v"* ]]; then
                    len=${#arr[@]}
                    #when all files in that tar must be extracted
                    if [ $len -eq 3 ]; then
                        declare -i flag=0
                        declare -i lines=0
                        name=""
                        file=${arr[2]}
                        i=1
                        #going through tar line by line
                        #delimiters seperate different file, so it can be used to extract that file data
                        #write and append mode is taken care of
                        while read line; do  
                        if [ "$line" = "$random" ]; then
                            flag=1
                        elif [ $flag -eq 1 ]; then
                            flag=0
                            name=$line
                            lines=1
                        elif [ $lines -eq 1 ]; then
                            echo $line > $name       #sending line by line to the new file 
                            let lines=lines+1
                        elif [ $lines -gt 1 ]; then
                            echo $line >> $name
                        fi
                        i=$((i+1))  
                        done < $file  
                    #when particular files from tar must be extracted
                    elif [ $len -gt 3 ]; then
                        declare -i temp1=0
                        #this loop goes through the files given which must be extracted
                        for elem in ${arr[@]}
                        do 
                            if [ $temp1 -gt 2 ]; then
                                file=${arr[2]}
                                i=1  
                                declare -i flag=0
                                declare -i lines=0
                                declare -i process=0
                                name=""
                                file=${arr[2]}
                                i=1
                                #this loop goes through the tar to find that file and get that data
                                #write and append mode is taken care of
                                while read line
                                do  
                                    if [ "$line" = "$random" ]; then
                                        flag=1
                                        if [ $process -eq 1 ]; then
                                            break
                                        fi
                                    elif [ $flag -eq 1 ]; then
                                        flag=0
                                        name=$line
                                        lines=1
                                    elif [ $lines -eq 1 ]; then
                                        let lines=lines+1
                                        if [ "$name" = "$elem" ]; then
                                            echo $line > $name       #sending line by line to the new particular file 
                                            process=1
                                        fi
                                        
                                    elif [ $lines -gt 1 ]; then
                                        if [ "$name" = "$elem" ]; then
                                            echo $line >> $name
                                        fi
                                    fi
                                    i=$((i+1))  
                                done < $file                       
                            else 
                                let temp1=temp1+1
                            fi
                        done             
                    else
                        echo "wrong input"
                    fi
                else
                    echo "please change input"
                fi
                #displays verbose information
                if [[ "${arr[1]}" == *"v"* ]]; then
                    declare -i temp1=0
                    for elem in ${arr[@]}
                    do 
                        if [ $temp1 -gt 2 ]; then
                            echo $elem
                            let temp1=temp1+1
                        else 
                            let temp1=temp1+1
                        fi
                    done
                fi
            else
                echo "wrong input"
            fi
        #diplays files in archived file
        elif [ $t -eq 1 ]; then
            len=${#arr[@]}
            if [ $len -eq 3 ]; then
                if [[ "${arr[1]}" == *"f"* ]]; then
                    #includes verbose information 
                    if [[ "${arr[1]}" == *"v"* ]]; then
                        file=${arr[2]}    
                        i=1  
                        while read line; do  
                        if [ "$line" = "$random" ]; then    #output all the lines till the dtring delimiter is reached
                            break
                        fi  
                        echo "$line"
                        i=$((i+1))  
                        done < $file  
                    #outputs only the file names in the archived file(tar)
                    elif [ $length -eq 2 ]; then
                        file=${arr[2]}    
                        i=1  
                        declare -i pro=0 
                        while read line; do  
                        if [ "$line" = "$random" ]; then
                            pro=1
                        elif [ $pro -eq 1 ]; then    #output only the file names
                            echo "$line"
                            pro=0
                        fi  
                        i=$((i+1))  
                        done < $file  
                    fi
                else
                    echo "wrong input"
                fi
            elif [ $len -gt 3 ]; then     #when particular files are mentioned
                if [[ "${arr[1]}" == *"f"* ]]; then
                    #includes verbose information 
                    if [[ "${arr[1]}" == *"v"* ]]; then
                        declare -i temp=0
                        declare -i number=0
                        #file content is sent to the tar file
                        for elem in ${arr[@]}
                        do 
                            if [ $temp -gt 2 ]; then
                                ls -l | egrep $elem    
                                let number=number+1
                            else 
                                let temp=temp+1
                            fi
                        done 
                    elif [ $length -eq 2 ]; then
                        declare -i temp=0
                        declare -i number=0
                        #file content is sent to the tar file
                        for elem in ${arr[@]}
                        do 
                            if [ $temp -gt 2 ]; then
                                echo "$elem"
                                let number=number+1
                            else 
                                let temp=temp+1
                            fi
                        done 
                    fi
                fi
            fi  
        fi
    fi
fi