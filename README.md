# QMLAnimation

Using QML let you do some cool animation on some component of your user interface, animation is a really powerful feature in Qt QML. Animation type cannot be instantiated directly or even used. Instead, the Animation type exists to provide a set of properties and methods that are availables across all the other animations types that inherits from it. Basically the Animation type is an interface that concrete animations inherit from.

## Changing the behavior through animation

When you are modifying the window at runtime of your application (per say: changing both width and/or height), you can trigger an animation by simply using the Behavior component like so:

```QML
...
Window {
    ...
    color: "#202020"

    Rectangle {
        id: myRect
        width: parent.width - 150
        height: parent.height - 150
        anchors.centerIn: parent
        color: "#90ee90"

        Behavior on width {

        }
    }
}
```

Sometimes, you want to animate when you are streching the window on width, you can add annimation through the Behavior on width component like the followings:

```QML
Rectangle {
    ...
    Behavior on width {
        NumberAnimation {
            duration: 1500
        }
    }
}
```

Actually, you can then handle the animation when you are changing the width of your component