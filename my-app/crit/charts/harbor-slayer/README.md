# harbor-slayer

`harbor-slayer` is a kubernetes job that can pull multiple images parallelly from a specified repository.

## Running

To run the test just specify images to be pulled in value files and run helm install.

For example:
'''
helm install harbor-slayer . -f vdu-values.yaml
'''
