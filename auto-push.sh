#!/bin/bash


for i in {16..20}
do
   VOL=$i php artisan db:seed --class=GitModelCollectionVolImages
   cd ./storage/dataset && \
       git checkout -b v$i main && \
       git add --all && \
       git commit -m add-data-set-for-v$i && \
       git push origin v$i && \
       git tag -a v0.0.$i -m add-data-set-for-v$i && \
       git push --tags && cd ../../
done
