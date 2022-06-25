##### Colours #####
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Green='\033[0;32m'        # Green
Cyan='\033[0;36m'         # Cyan

alias cls='printf "\033c"'
##### Colours End #####

# Staring Project
project=$1
if [ -z "$project" ]; then
    while :
    do
        read -p "$(printf "${Cyan}Please enter a project name:${Color_Off}") " project
        if [ ! -z "$project" ]; then
            break
        fi
    done
fi
printf "${Cyan}Creating project ${Green}${project}${Color_Off}\n"

# Create Project
yarn create snowpack-app ${project} --template @snowpack/app-template-react-typescript --force
sleep 1
cls

# Install Dependencies
cd ${project}
printf "${Cyan}Installing Dependencies${Color_Off}\n"
sleep 1
yarn add -D @snowpack/plugin-postcss postcss postcss-cli tailwindcss autoprefixer
sleep 1
cls

# Setup snowpack.config.mjs
printf "${Cyan}Setting up ${Green}snowpack.config.mjs${Color_Off}\n"
sleep 1
cat ../snowpack.config.mjs > snowpack.config.mjs
printf "${Green}Done!"
sleep 1
cls

# Setup postcss.config.js
printf "${Cyan}Setting up ${Green}postcss.config.js${Color_Off}\n"
sleep 1
cat ../postcss.config.js > postcss.config.js
printf "${Green}Done!"
sleep 1
cls

# Setup tailwind.config.js
printf "${Cyan}Setting up ${Green}tailwind.config.js${Color_Off}\n"
sleep 1
cat ../tailwind.config.js > tailwind.config.js
printf "${Green}Done!"
sleep 1
cls

# Setup index.css
printf "${Cyan}Setting up ${Green}index.css${Color_Off}\n"
sleep 1
cat ../index.css > ./src/index.css
printf "${Green}Done!"
sleep 1
cls

# Setup App.tsx
printf "${Cyan}Setting up ${Green}App.tsx${Color_Off}\n"
sleep 1
cat ../App.tsx > ./src/App.tsx
printf "${Green}Done!"
sleep 1
cls

# Success Message
cd ${project}
printf "${Green}Successfully created ${project}!${Color_Off}\n"
printf "${Color_Off}To run your project run ${Cyan}yarn start${Color_Off}\n"
