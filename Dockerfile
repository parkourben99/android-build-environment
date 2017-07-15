# Android Dockerfile

FROM uber/android-build-environment:latest

MAINTAINER "ben@aylessoftware.com"

ENV ANDROID_COMPONENTS android-25,build-tools-25.0.0,extra-android-m2repository

# Update gradle
RUN sdk install gradle 3.3-all

# Install Android Build tools
RUN echo y | /usr/local/android-sdk/tools/android update sdk --filter "${ANDROID_COMPONENTS}" --no-ui -a

RUN mkdir -p "${ANDROID_HOME}/licenses" || true \
    && echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > "${ANDROID_HOME}/licenses/android-sdk-license"