PROV=$1
cp providers/aws.yaml providers/$PROV.yaml
sed -i '' s/REPLACE_ME/$PROV/g providers/$PROV.yaml
cp ../README.md ../README-$PROV.md
sed -i '' s/REPLACE_THIS/$PROV/g ../README-$PROV.md
