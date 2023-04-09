import sys
from googletrans import Translator

# if __name__ == '__main__':
    # from gi.repository import Gtk
    # import gi
    # gi.require_version('Gtk', '3.0')
    # text = sys.argv[1].replace('"', '')
    # translator = Translator()
    # translation = translator.translate(text, dest='es')
    # t_text = translation.text

    # class MyWindow(Gtk.Window):
        # def __init__(self):
            # Gtk.Window.__init__(self)
            # self.set_title("romodoro")
            # self.set_keep_above(True)

            # eventbox = Gtk.EventBox()
            # eventbox.connect("button-press-event", self.on_event_press)
            # self.add(eventbox)

            # label = Gtk.Label()
            # label.set_markup(f"<big>{t_text}</big>")
            # label.set_line_wrap(True)
            # label.set_size_request(600, -1)

            # table = Gtk.Table(1, 1, False)
            # table.attach(label, 0, 1, 0, 1,
                         # Gtk.AttachOptions.SHRINK | Gtk.AttachOptions.FILL)
            # eventbox.add(table)

        # def on_event_press(self, widget, event):
            # Gtk.main_quit()

    # window = MyWindow()
    # window.connect("destroy", Gtk.main_quit)
    # window.connect("key_press_event", Gtk.main_quit)
    # window.connect("focus-out-event", Gtk.main_quit)
    # window.show_all()

    # Gtk.main()


# Simple version
if __name__ == '__main__':
    from tkinter import messagebox
    import tkinter

    text = sys.argv[1].replace('"', '')
    translator = Translator()
    translation = translator.translate(text, dest='es')
    root = tkinter.Tk()
    root.withdraw()

    messagebox.showinfo("tanslation", translation.text)
