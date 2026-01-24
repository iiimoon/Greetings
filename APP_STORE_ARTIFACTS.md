# Generating App Store Artifacts

This guide explains how to create the build artifact (IPA file) required for App Store submission.

## 1. Prepare for Release

1.  **Open Xcode**.
2.  Select your project in the Project Navigator.
3.  Select the **Greetings** target.
4.  **General Tab**:
    *   **Version**: Ensure this is correct (e.g., 1.0).
    *   **Build**: Increment this for every new upload (e.g., 1, 2, 3...).
5.  **Signing & Capabilities Tab**:
    *   Ensure **Automatically manage signing** is checked.
    *   Ensure your **Team** is selected.

## 2. Archive the App

1.  Select **Any iOS Device (arm64)** from the device picker in the top toolbar (do not select a simulator).
2.  Go to menu **Product** > **Archive**.
3.  Xcode will build the app and open the **Organizer** window when finished.

## 3. Upload to App Store Connect (Recommended)

This is the standard way to send your artifact to Apple.

1.  In the **Organizer** window, select your latest archive.
2.  Click **Distribute App**.
3.  Select **App Store Connect** > **Next**.
4.  Select **Upload** > **Next**.
5.  **App Store Connect distribution options**:
    *   Keep all checkboxes checked (Upload symbols, Manage Version/Build #).
    *   Click **Next**.
6.  **Signing**:
    *   Select **Automatically manage signing** > **Next**.
7.  Review the details and click **Upload**.

*Result: Your build will appear in App Store Connect under TestFlight/Builds after processing (10-30 mins).*

## 4. Export IPA Manually (Alternative)

If you need the `.ipa` file (the actual artifact) to upload manually using the "Transporter" app or for other reasons:

1.  In the **Organizer** window, select your archive.
2.  Click **Distribute App**.
3.  Select **App Store Connect** > **Next**.
4.  Select **Export** > **Next**.
5.  Follow the prompts (keep default options) until you reach the summary.
6.  Click **Export**.
7.  Choose a folder to save the output.

*Result: You will get a folder containing `Greetings.ipa`. This file is your App Store artifact.*

## 5. Other Required "Artifacts"

Besides the binary, you need these ready in App Store Connect:

*   **Screenshots**: 
    *   iPhone 6.7" (1290 x 2796 px)
    *   iPhone 6.5" (1242 x 2688 px)
    *   iPhone 5.5" (1242 x 2208 px)
    *   iPad Pro (2nd/6th gen) (2048 x 2732 px)
*   **App Icon**: 1024x1024 png (already in your Assets).
*   **Privacy Policy URL**: (You have this ready).
