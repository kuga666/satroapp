from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.textinput import TextInput


class MyScreen(BoxLayout):  # Changed to a BoxLayout for simplicity

    def __init__(self, **kwargs):
        # Call the base class constructor :)
        super(MyScreen, self).__init__(**kwargs)
        self.orientation = "vertical"

        # Here we are just creating a text input
        my_user_input = TextInput()

        # Here we add it to MyScreen's widget tree.
        self.add_widget(my_user_input)

        # This is the label that will hold a modified version of the user's input
        my_output = Label(text="")
        self.add_widget(my_output)

        # Here we create a callback function
        # This callback will be called whenever the 'text' property of our TextInput is modified
        def callback(instance, value):
            conversion: str = ""
            for word in value.split():
                if len(word) > 0 and word.isalpha():
                    word = word.lower()
                    last = word[-2:]
                    rest = word[0:-2]
                    shatword = last + rest
                    conversion += shatword + " "
                    my_output.text = conversion

        # Here we "bind" the callback to the TextInput's 'text' property
        my_user_input.bind(text=callback)


class ŠatroApp(App):

    def build(self):
        self.title ="ŠatroApp"
        return MyScreen()


if __name__ == '__main__':
    ŠatroApp().run()
