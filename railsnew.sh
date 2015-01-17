#! /bin/bash

#OPTIND=1

#database_arg=""
#folder="."
#database_name_base=""

#while getopts "d:t:n:" opt; do
  #case $opt in
    #n)
      #folder=$OPTARG
      #echo "-n was triggered, Parameter: $OPTARG" >&2
      #;;
    #t)
      #database_arg="-d $OPTARG"
      #echo "-t was triggered, Parameter: $OPTARG" >&2
      #;;
    #d)
      #database_name_base=$OPTARG
      #echo "-d was triggered, Parameter: $OPTARG" >&2
      #;;
    #\?)
      #echo "Invalid option: -$OPTARG" >&2
      #exit 1
      #;;
    #:)
      #echo "Option -$OPTARG requires an argument." >&2
      #exit 1
      #;;
  #esac

#done

#rails_cmd="rails new $folder -T -q $database_arg"
#echo "Running Rails command: $rails_cmd"
#$($rails_cmd)
#cd $folder
#git init
#git add .
#git commit -m "Initial Rails new results"



declare -a gems=("figaro" "factory_girl_rails" "pry-rails" "rspec-rails")
for i in "${gems[@]}"
do
  awk  '/group :development, :test/ { print; print "  gem '\'''$i''\''"; next  }1' Gemfile > 'Gemfile.temp'
  rm Gemfile
  mv Gemfile.temp Gemfile
done

bundle install
figaro install
