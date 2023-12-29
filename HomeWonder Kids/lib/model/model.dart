class Question {
  final String text;
  final List<Option> options;
  final String imgName;
  bool isLocked;
  Option? selectedOption;

  final String imagePath;

  Question({
    required this.text,
    required this.options,
    required this.imgName,
    required this.imagePath,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool inCorrect;

  const Option({
    required this.text,
    required this.inCorrect,
  });
}

final questions = [
  Question(
    text:
        'A ____ is like a big pocket with handles. It holds your toys, snacks, and things you need when you go out.',
    imgName: 'bag.png',
    imagePath: 'assets/for_quiz/bag.png',
    options: [
      const Option(text: 'Bag', inCorrect: true),
      const Option(text: 'Notebook', inCorrect: false),
      const Option(text: 'Scissors', inCorrect: false),
      const Option(text: 'Shoes', inCorrect: false),
    ],
  ),
  Question(
    text:
        '_____ are like special friends made of paper. They have stories and pictures that you can read and enjoy.',
    imgName: 'book.png',
    imagePath: 'assets/for_quiz/book.png',
    options: [
      const Option(text: 'Ruler', inCorrect: false),
      const Option(text: 'Chair', inCorrect: false),
      const Option(text: 'Scissors', inCorrect: false),
      const Option(text: 'Book', inCorrect: true),
    ],
  ),
  Question(
    text:
        'A _____ is a special seat for sitting. It keeps you comfy when you read, eat, or play.',
    imgName: 'chair.png',
    imagePath: 'assets/for_quiz/chair.png',
    options: [
      const Option(text: 'Pencil', inCorrect: false),
      const Option(text: 'Notebook', inCorrect: false),
      const Option(text: 'Chair', inCorrect: true),
      const Option(text: 'Book', inCorrect: false),
    ],
  ),
  Question(
    text:
        'A ______ is a long, straight tool with numbers. It helps you draw straight lines and measure things.',
    imgName: 'ruler.png',
    imagePath: 'assets/for_quiz/ruler.png',
    options: [
      const Option(text: 'Ruler', inCorrect: true),
      const Option(text: 'Notebook', inCorrect: false),
      const Option(text: 'Crayons', inCorrect: false),
      const Option(text: 'Scissors', inCorrect: false),
    ],
  ),
  Question(
    text:
        'A ______ is a writing tool with a point. You use it for drawing and writing.',
    imgName: 'pencil.png',
    imagePath: 'assets/for_quiz/pencil.png',
    options: [
      const Option(text: 'Book', inCorrect: false),
      const Option(text: 'Chair', inCorrect: false),
      const Option(text: 'Eraser', inCorrect: false),
      const Option(text: 'Pencil', inCorrect: true),
    ],
  ),
  Question(
    text:
        'A ________ is like your personal paper book. You can write in it, draw pictures, and keep all your thoughts in one place.',
    imgName: 'notebook.png',
    imagePath: 'assets/for_quiz/notebook.png',
    options: [
      const Option(text: 'Eraser', inCorrect: false),
      const Option(text: 'Scissors', inCorrect: false),
      const Option(text: 'Notebook', inCorrect: true),
      const Option(text: 'Shoes', inCorrect: false),
    ],
  ),
  Question(
    text:
        '_______ are colorful sticks for drawing. You use them to make your pictures bright and happy.',
    imgName: 'crayons.png',
    imagePath: 'assets/for_quiz/crayons.png',
    options: [
      const Option(text: 'Shoes', inCorrect: false),
      const Option(text: 'Crayons', inCorrect: true),
      const Option(text: 'Eraser', inCorrect: false),
      const Option(text: 'Bag', inCorrect: false),
    ],
  ),
  Question(
    text:
        'An _______ helps you fix mistakes. It is like magic for taking away pencil marks and making your work look neat.',
    imgName: 'eraser.png',
    imagePath: 'assets/for_quiz/eraser.png',
    options: [
      const Option(text: 'Bag', inCorrect: false),
      const Option(text: 'Shoes', inCorrect: false),
      const Option(text: 'Eraser', inCorrect: true),
      const Option(text: 'Scissors', inCorrect: false),
    ],
  ),
  Question(
    text:
        '______ are things you wear on your feet. They protect your feet and make it comfortable to walk and run.',
    imgName: 'shoes.png',
    imagePath: 'assets/for_quiz/shoes.png',
    options: [
      const Option(text: 'Eraser', inCorrect: false),
      const Option(text: 'Scissors', inCorrect: false),
      const Option(text: 'Bag', inCorrect: false),
      const Option(text: 'Shoes', inCorrect: true),
    ],
  ),
  Question(
    text:
        '_______ are tools for cutting paper or making crafts. They have two blades that open and close.',
    imgName: 'scissors.png',
    imagePath: 'assets/for_quiz/scissors.png',
    options: [
      const Option(text: 'Ruler', inCorrect: false),
      const Option(text: 'Crayons', inCorrect: false),
      const Option(text: 'Pencil', inCorrect: false),
      const Option(text: 'Scissors', inCorrect: true),
    ],
  ),
];
