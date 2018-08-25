# Solidity I & II: Certifier DApp

## v0.2.0
Injecting the front end framework to the project

First, we must install the VueJS command line utility as global dependency.

```bash
npm i -g @vue/cli
```

Then we go a level above to install the frontend.

```bash
cd ..
vue create certifier
```

Then we must answer a couple of questions the cli prompts

1. Target directory? → Merge
2. Picking presets → Manually
3. You must use whatever you want, but the recommendation is → Babel, Router, Vuex, CSS Preprocessors
4. Use of history mode → Yes
5. CSS - Pre-processors → SASS/SCSS
6. Prefered places for presets → Dedicated config files
7. Saving presets → As you wish

Then, back inside the project we must install once again `chai`.

```bash
npm i -D chai
```