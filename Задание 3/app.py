import tkinter as tk
from tkinter import ttk

class PartnerBlock(tk.Frame):
    def __init__(self, parent):
        super().__init__(parent, bd=2, relief='groove', padx=5, pady=5, bg='#BBDCFA')
        self.create_widgets()

    def create_widgets(self):
        # Левая часть поля
        left_frame = tk.Frame(self, bg='#BBDCFA')
        left_frame.pack(side='left', fill='both', expand=True)

        self.type_var = tk.StringVar()
        tk.Label(left_frame, text="Тип", bg='#BBDCFA').pack(anchor='w')
        tk.Entry(left_frame, textvariable=self.type_var).pack(fill='x')

        self.name_var = tk.StringVar()
        tk.Label(left_frame, text="Наименование партнера", bg='#BBDCFA').pack(anchor='w')
        tk.Entry(left_frame, textvariable=self.name_var).pack(fill='x')

        self.address_var = tk.StringVar()
        tk.Label(left_frame, text="Юр. адрес", bg='#BBDCFA').pack(anchor='w')
        tk.Entry(left_frame, textvariable=self.address_var).pack(fill='x')

        self.phone_var = tk.StringVar()
        tk.Label(left_frame, text="Номер телефона", bg='#BBDCFA').pack(anchor='w')
        tk.Entry(left_frame, textvariable=self.phone_var).pack(fill='x')

        self.rating_var = tk.StringVar()
        tk.Label(left_frame, text="Рейтинг", bg='#BBDCFA').pack(anchor='w')
        tk.Entry(left_frame, textvariable=self.rating_var).pack(fill='x')

        right_frame = tk.Frame(self, bg='#BBDCFA')
        right_frame.pack(side='right', fill='y', padx=10)

        tk.Label(right_frame, text="Стоимость", bg='#BBDCFA').pack()
        self.cost_var = tk.StringVar()
        tk.Entry(right_frame, textvariable=self.cost_var).pack()

class App(tk.Tk):
    def __init__(self):
        super().__init__()
        
        self.title("Заявки партнеров")
        
        self.configure(bg="#FFFFFF")
        
        self.geometry("800x600")

        style = ttk.Style()
        
        style.configure('Blue.TButton', background='#0C4882', foreground='#0C4882')
        
        add_button = ttk.Button(self, text="Добавить блок", command=self.add_block, style='Blue.TButton')
        
        style.map('Blue.TButton',
                  background=[('active', '#084A7A'), ('!active', '#0C4882')],
                  foreground=[('active', '#084A7A'), ('!active', '#084A7A')])
                  
        
        add_button.pack(pady=10)

        self.canvas = tk.Canvas(self, bg='#BBDCFA')
        
        scrollbar = ttk.Scrollbar(self, orient="vertical", command=self.canvas.yview)
        
        self.scrollable_frame = ttk.Frame(self.canvas)

        self.scrollable_frame.bind(
            "<Configure>",
            lambda e: self.canvas.configure(
                scrollregion=self.canvas.bbox("all")
            )
        )

        self.canvas.create_window((0, 0), window=self.scrollable_frame, anchor="nw")
        
        self.canvas.configure(yscrollcommand=scrollbar.set)

        self.canvas.pack(side="left", fill="both", expand=True)
        scrollbar.pack(side="right", fill="y")

    def add_block(self):
        block = PartnerBlock(self.scrollable_frame)
        
        block.pack(pady=5, fill='x', expand=True)

if __name__ == "__main__":
    app = App()

    
    app.iconbitmap('Новые технологии.ico')

    app.mainloop()