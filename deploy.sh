for f in *;  do
  if [[ ( -d ${f} ) && ( ${f} != "images" ) ]]
  then
    echo ${f};
    scp -r -P 7822 ${f} top8team@top8.biz:/home/top8team/public_html/talmudilluminated.com/
  fi
done;
