# Name: Dinh Nguyen
# CS 265 Assignment 1 - a1-top
# Parse any README files in current directory and subdirectories
# Output into dir.json to each directory

#!/bin/bash

dir=$1

# Remove preexisting dir.json at top directory
if [ -f dir.json ]; then
	rm dir.json
fi


# Find all subdirectories
for subdir in $(find $dir -type d) ; do
	
	# Remove preexisted index, required, dir.json at subdirectories
	if [ -f .required ]; then
		rm .required
	fi
	if [ -f .index ]; then 
		rm .index
	fi
	if [ -f "$subdir"/dir.json ]; then
		rm "$subdir"/dir.json
	fi
	
	# Handle directories with README
	if [ -f "$subdir"/README ]; then 
		# Parse README
		cat "$subdir"/README | awk -f "filter.awk" 
		
		# README with index
		if [ -f .index ]; then
				
				required_files=()
				required_directories=()
				other_files=()
				other_directories=()
				
				if [ -f .required ]; then		
				# Parse required files and directories to array
				for required_item in $(cat .required) ; do
					if [ -d "$subdir"/"$required_item" ]; then
						required_directories+=( \"$required_item\" )
					elif [ -f "$subdir"/"$required_item" ]; then
						required_files+=( \"$required_item\" )
					fi
				done
				fi

				# Parse other files and directories to array
				for other_item in $(ls "$subdir") ; do

					if [ -d "$subdir"/"$other_item" ]; then
						other_directories+=( \"$other_item\" )
						for reqd in ${required_directories[@]}
						do
							other_directories=("${other_directories[@]/$reqd}")
						done
                  for i in ${!other_directories[@]}
                  do
                     if [ "${other_directories[$i]}" == "" ]; then
	                     unset other_directories[$i]
	                  fi
	               done

					elif [ -f "$subdir"/"$other_item" ] && [ "$other_item" != "README" ] && [ "$other_item" != "$(cat .index)" ]; then
						other_files+=( \"$other_item\" )
						for reqf in ${required_files[@]}
						do
							other_files=("${other_files[@]/$reqf}")
						done
						for i in ${!other_files[@]}
						do
							if [ "${other_files[$i]}" == "" ]; then
								unset other_files[$i]
							fi
						done

					fi
				done
				# Write output to dir.json
				printf "{\n\t\"index\": \"%s\",\n" $(cat .index) >> "$subdir"/"dir.json"
				printf "\t\"required\": {\n" >> "$subdir"/"dir.json"
				printf "\t\t\"files\": [%s],\n" $(IFS=$','; echo "${required_files[*]}") >> "$subdir"/"dir.json"
				printf "\t\t\"directories\": [%s]\n" $(IFS=$','; echo "${required_directories[*]}") >> "$subdir"/"dir.json"
				printf "\t},\n" >> "$subdir"/"dir.json"
				printf "\t\"other\": {\n" >> "$subdir"/"dir.json"
				printf "\t\t\"files\": [%s],\n" $(IFS=$','; echo "${other_files[*]}") >> "$subdir"/"dir.json"
				printf "\t\t\"directories\": [%s]\n" $(IFS=$','; echo "${other_directories[*]}") >> "$subdir"/"dir.json"
				printf "\t}\n" >> "$subdir"/"dir.json"
				printf "}\n" >> "$subdir"/"dir.json"

		# README without index
		else 	
				required_files=()
				required_directories=()
				other_files=()
				other_directories=()
			
				if [ -f .required ]; then			
				# Parse required files and directories to array
				for required_item in $(cat .required) ; do
					if [ -d "$subdir"/"$required_item" ]; then
						required_directories+=( \"$required_item\" )
					elif [ -f "$subdir"/"$required_item" ]; then
						required_files+=( \"$required_item\" )
					fi
				done
				fi

				# Parse other files and directories to array
				for other_item in $(ls "$subdir") ; do
					if [ -d "$subdir"/"$other_item" ]; then
						other_directories+=( \"$other_item\" )
						for reqd in ${required_directories[@]}
						do
							other_directories=("${other_directories[@]/$reqd}")
						done
                  for i in ${!other_directories[@]}
                  do
                     if [ "${other_directories[$i]}" == "" ]; then
	                     unset other_directories[$i]
	                  fi
	               done

					elif [ -f "$subdir"/"$other_item" ] && [ "$other_item" != "README" ]; then
						other_files+=( \"$other_item\" )
						for reqf in ${required_files[@]}
						do
							other_files=("${other_files[@]/$reqf}")
						done
						for i in ${!other_files[@]}
						do
							if [ "${other_files[$i]}" == "" ]; then
								unset other_files[$i]
							fi
						done
					fi
				done
				# Write output to dir.json
				printf "{\n\t\"index\": \"\",\n" >> "$subdir"/"dir.json"	
				printf "\t\"required\": {\n" >> "$subdir"/"dir.json"
				printf "\t\t\"files\": [%s],\n" $(IFS=$','; echo "${required_files[*]}") >> "$subdir"/"dir.json"
				printf "\t\t\"directories\": [%s]\n" $(IFS=$','; echo "${required_directories[*]}") >> "$subdir"/"dir.json"
				printf "\t},\n" >> "$subdir"/"dir.json"
				printf "\t\"other\": {\n" >> "$subdir"/"dir.json"
				printf "\t\t\"files\": [%s],\n" $(IFS=$','; echo "${other_files[*]}") >> "$subdir"/"dir.json"
				printf "\t\t\"directories\": [%s]\n" $(IFS=$','; echo "${other_directories[*]}") >> "$subdir"/"dir.json"
				printf "\t}\n" >> "$subdir"/"dir.json"
				printf "}\n" >> "$subdir"/"dir.json"
		fi
	# Handle directories without README
	else 
		other_files=()
      other_directories=()

		for other_item in $(ls "$subdir") ; do
			if [ -d "$subdir"/"$other_item" ]; then
				other_directories+=( \"$other_item\" )
			elif [ -f "$subdir"/"$other_item" ]; then
				other_files+=( \"$other_item\" )
			fi
		done

		# Write output to dir.json
		printf "{\n\t\"index\": \"\",\n" >> "$subdir"/"dir.json"
		printf "\t\"required\": {\n" >> "$subdir"/"dir.json" 
		printf "\t\t\"files\": [],\n" >> "$subdir"/"dir.json"
		printf "\t\t\"directories\": []\n" >> "$subdir"/"dir.json"
		printf "\t},\n" >> "$subdir"/"dir.json"
      printf "\t\"other\": {\n" >> "$subdir"/"dir.json"
		printf "\t\t\"files\": [%s],\n" $(IFS=$','; echo "${other_files[*]}") >> "$subdir"/"dir.json"
		printf "\t\t\"directories\": [%s]\n" $(IFS=$','; echo "${other_directories[*]}") >> "$subdir"/"dir.json"
		printf "\t}\n" >> "$subdir"/"dir.json"
		printf "}\n" >> "$subdir"/"dir.json"
	fi
	
done

# Remove .index, .required off the top directory created by filter.awk
if [ -f .index ]; then
	rm .index
fi
if [ -f .required ]; then
	rm .required
fi

#END OF FILE

