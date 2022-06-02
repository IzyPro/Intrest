# Intrests

Built with Flutter and Riverpod, Intrests covers the basics of selecting items from a scattered list of interests with options to select between 3 and 7 interests, search the unselected list, unselect interests etc. It also covers functions and widget testing in flutter.

<img src="https://github.com/IzyPro/Intrest/blob/main/screenshot2.png" width="250">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://github.com/IzyPro/Intrest/blob/main/screenshot.png" width="250">
## Download
Download the apk [here](https://drive.google.com/file/d/13B2WTQ3H-ZXQ32BNdeOal7LBYaeKAQ-m/view?usp=sharing) to see it in action.

## Instruction
### Step 1: Clone the Repo
Navigate to the directory of your choice on your local computer and run the clone comand below

```bash
git clone https://github.com/IzyPro/Intrest.git
```

### Step 2: Run the Project
Open the project folder in VS Code, select the target device at the bottom right corner, open a new terminal and run the `flutter run` command.

```bash
flutter run
```

### Step 3: Run the Tests
Open your terminal and run the `flutter test` command.

```bash
flutter test
```

## Modification and Improvements
### 1. Carousel List
Make the staggered list a horizontal scrollable carousel to provide spacing for some other contents on the page.
### 2. Consume an API
Fetch the list of interest/topics from an open API like twitter, github, dummyapi or jsonplaceholder.
### 3. Disabled Button Test
Add tests to further test if the button is disabled when selected interest/topics is less than 3 or greater than 7.
