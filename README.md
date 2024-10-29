# Cafedential
![CafedentialApp](https://socialify.git.ci/whiteSHADOW1234/CafedentialApp/image?font=Source%20Code%20Pro&forks=1&issues=1&logo=https%3A%2F%2Fhackmd-prod-images.s3-ap-northeast-1.amazonaws.com%2Fuploads%2Fupload_5e3f3a762df64b78b518e403d06856da.svg%3FAWSAccessKeyId%3DAKIA3XSAAW6AWSKNINWO%26Expires%3D1730231728%26Signature%3D1USFmU4l4h49bQGpH2Hj3jvtl88%253D&name=1&pattern=Charlie%20Brown&pulls=1&stargazers=1&theme=Dark)


<p align="center">
  <img src="https://img.shields.io/badge/firebase-ffca28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase Badge" />
  <img src="https://img.shields.io/github/license/whiteSHADOW1234/CafedentialApp?label=license&style=for-the-badge" alt="License Badge" />
  <img src="https://img.shields.io/badge/FLUTTER->=3.3.0-blue?style=for-the-badge" alt="Flutter Badge" />
  <img src="https://img.shields.io/badge/DART->=2.18.0<3.0.0-orange?style=for-the-badge" alt="Dart Badge" />
  <img src="https://img.shields.io/badge/PRs-welcome-black?style=for-the-badge" alt="PRs Welcome Badge" />
</p>



This open-source Flutter app allows coffee enthusiasts and professionals to score their coffee based on the Specialty Coffee Association (SCA) Cupping Protocol. It’s designed to offer an intuitive experience for evaluating coffee attributes and storing detailed tasting notes.

## Features

- **Custom Icon & Splash Screen**: The app features a custom icon and splash screen, providing a welcoming first impression.
  
- **Authentication**: Users are greeted with a welcome screen, where they can either log in or register a new account. After registering, users are automatically signed in every time they open the app.

- **Error Detection**: Every input field in the app includes error handling to guide users in case of incorrect or missing data.

### Main Functionality

1. **Coffee Notes Panel**:
   - **Main Page**: Displays a panel with cards for each coffee note, showing the coffee name, total score, final score, and notes.
   - **Add Coffee Note**: Tap the floating button to go to the "Add Data" screen, where users can rate their coffee based on several aspects like temperature, grind size, brew time, and brew method.
   - **Automatic Scoring**: Scores are calculated automatically based on the input values, providing immediate feedback on each coffee.

2. **Detailed View & Edit Mode**:
   - **View Mode**: Tap on a coffee card to view the details of the scoring notes.
   - **Edit Mode**: Users can press the "pen" icon at the top-right of the screen to enter edit mode. All fields are pre-populated with stored values for easy updating. Once edits are complete, users can save their changes to update the database.

3. **Delete Notes**:
   - **Long-Press**: Long-press a card on the main page to open a confirmation dialog for deleting the note.
   - **Delete Icon**: Alternatively, tap a coffee card, enter the detailed view, and press the trash can icon at the top-right corner to delete the note.

4. **Friendly Hints**: If there are no notes, the main page displays a friendly GIF and hints to encourage users to add their first note.

## Screens

1. **Splash Screen**: Displays the app’s icon as it loads.

    ![Group 68 (1)](https://hackmd.io/_uploads/SJfeY20xkx.svg)
2. **Authentication Screen**: Provides options for logging in or registering. If a new account is created, the app remembers it for automatic sign-in.
    | Welcome Screen                       | Login Screen                         | Register Screen                      |
    | ------------------------------------ | ------------------------------------ | ------------------------------------ |
    | ![](https://i.imgur.com/ZqbHPdL.png) | ![](https://i.imgur.com/Rbjh1eF.png) | ![](https://i.imgur.com/MBlzoRw.png) |
3. **Main Panel**: Lists coffee notes with scoring details. The floating button provides quick access to add a new note.
    | Home Page                            | Home Page with cards (notes)         |
    | ------------------------------------ | ------------------------------------ |
    | ![](https://i.imgur.com/FeIDHgr.png) | ![](https://i.imgur.com/C2ebmXY.png) |
4. **Add Data Screen**: Form-based screen to score coffee on various parameters. The “Save” button saves data and displays the note on the main panel.
    | Add Data Screen 1                    | Add Data Screen 2                    |
    | ------------------------------------ | ------------------------------------ |
    | ![](https://i.imgur.com/BgxduCi.png) | ![](https://i.imgur.com/ghd8YSN.png) |
5. **Note Detail & Edit Mode**: Provides detailed view and editing options for each coffee note.
    | Noted Detail                         | Edit Mode                            |
    | ------------------------------------ | ------------------------------------ |
    | ![](https://i.imgur.com/k8qfv0V.png) | ![](https://i.imgur.com/62RStkJ.png) |
    
## Getting Started

### Prerequisites
- Install Flutter SDK
- Configure Firebase (or other backend) for authentication and storage

### Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/whiteSHADOW1234/CafedentialApp.git
   ```
2. Navigate to the project directory:
   ```bash
   cd CafedentialApp
   ```
3. Run the app:
   ```bash
   flutter run
   ```

### Usage
1. Open the app and register or log in.
2. From the main page, tap the floating button to add a new coffee note.
3. Fill in each attribute, and save the form to add a new note.
4. Tap on any note to view, edit, or delete as needed.

## Contributing

Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch for your feature:
   ```bash
   git checkout -b feature-name
   ```
3. Make your changes and test thoroughly.
4. Submit a pull request.

## License

This project is licensed under the MIT License.
