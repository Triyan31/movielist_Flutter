import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List',
      home: MovieList(),
    );
  }
}

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final List<Map<String, dynamic>> _movies = [
    {
      'title': 'Avengers: Endgame',
      'poster': 'images/avengers_endgame.jpg',
      'rating': 8.4,
      'description':
          'After the devastating events of Avengers: Infinity War, the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.',
      'trailer': 'https://www.youtube.com/watch?v=TcMBFSGVi1c',
      'reviews': [
        {
          'username': 'JohnDoe',
          'rating': 9,
          'comment': 'Great movie! I loved how they tied up all the loose ends.'
        },
        {
          'username': 'JaneDoe',
          'rating': 7,
          'comment': 'Not as good as the previous Avengers movies.'
        }
      ]
    },
     {
      'title': 'Black Widow',
      'poster': 'images/black_widow.jpg',
      'rating': 6.8,
      'description':
          'Setelah peristiwa di film Captain America: Civil War, Natasha Romanoff alias Black Widow, harus menghadapi masa lalunya yang kelam dan menghadapi kekuatan yang misterius yang memburunya saat ia berjuang untuk membebaskan dirinya.',
      'trailer': 'https://www.youtube.com/watch?v=ybji16u608U',
      'reviews': [
        {
          'username': 'JohnDoe',
          'rating': 9,
          'comment': 'Great movie! I loved how they tied up all the loose ends.'
        },
        {
          'username': 'JaneDoe',
          'rating': 7,
          'comment': 'Not as good as the previous Avengers movies.'
        }
      ]
    },
    {
      'title': 'Joker',
      'poster': 'images/joker.jpg',
      'rating': 8.4,
      'description':
          'Film ini menceritakan kisah seorang pria bernama Arthur Fleck, seorang pelawak tunggal dan salah seorang warga Gotham City yang terpinggirkan. Ketika dunia terus menghancurkannya secara berulang-ulang, Arthur bergulat dengan kegilaan dan akhirnya menjadi penjahat terkenal, Joker.',
      'trailer': 'https://www.youtube.com/watch?v=vOW4oybCNAw',
      'reviews': [
        {
          'username': 'JohnDoe',
          'rating': 9,
          'comment': 'Great movie! I loved how they tied up all the loose ends.'
        },
        {
          'username': 'JaneDoe',
          'rating': 7,
          'comment': 'Not as good as the previous Avengers movies.'
        }
      ]
    },
    {
      'title': 'Spider-Man: No Way Home',
      'poster': 'images/spiderman_no_way_home.jpg',
      'rating': 7.9,
      'description':
          'Peter Parker harus menghadapi keadaan sulit ketika identitasnya terungkap dan ia dipaksa berurusan dengan konsekuensi yang membingungkan, sambil berusaha untuk meminta bantuan dari Dr. Strange untuk membalikkan kerusakan yang disebabkan oleh peristiwa di film sebelumnya.',
      'trailer': 'https://www.youtube.com/watch?v=JfVOs4VSpmA',
      'reviews': [
        {
          'username': 'JohnDoe',
          'rating': 9,
          'comment': 'Great movie! I loved how they tied up all the loose ends.'
        },
        {
          'username': 'JaneDoe',
          'rating': 7,
          'comment': 'Not as good as the previous Avengers movies.'
        }
      ]
    },
    {
      'title': 'Shang-Chi and the Legend of the Ten Rings',
      'poster': 'images/shang_chi.jpg',
      'rating': 7.9,
      'description':
          'Shang-Chi harus menghadapi masa lalunya ketika ia terlibat dalam organisasi kriminal yang dikuasai oleh ayahnya yang berbahaya dan misterius, dan menemukan kekuatan dalam dirinya yang lebih besar dari yang pernah ia bayangkan.',
      'trailer': 'https://www.youtube.com/watch?v=8YjFbMbfXaQ',
      'reviews': [
        {
          'username': 'JohnDoe',
          'rating': 9,
          'comment': 'Great movie! I loved how they tied up all the loose ends.'
        },
        {
          'username': 'JaneDoe',
          'rating': 7,
          'comment': 'Not as good as the previous Avengers movies.'
        }
      ]
    },
    {
      'title': 'The Suicide Squad',
      'poster': 'images/the_suicide_squad.jpg',
      'rating': 7.3,
      'description':
          'Tim yang terdiri dari penjahat paling berbahaya di dunia ditugaskan untuk melakukan misi yang hampir mustahil, dengan tekanan yang lebih besar dari yang pernah mereka alami sebelumnya, sambil berhadapan dengan ancaman baru yang mengerikan.',
      'trailer': 'https://www.youtube.com/watch?v=eg5ciqQzmK0',
      'reviews': [
        {
          'username': 'JohnDoe',
          'rating': 9,
          'comment': 'Great movie! I loved how they tied up all the loose ends.'
        },
        {
          'username': 'JaneDoe',
          'rating': 7,
          'comment': 'Not as good as the previous Avengers movies.'
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: MovieSearch(movies: _movies));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: List.generate(
              _movies.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            _movies[index]['poster'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          _movies[index]['title'],
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetail(movie: _movies[index]),
                              ),
                            );
                          },
                          child: Text('Details'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MovieDetail extends StatefulWidget {
  final Map<String, dynamic> movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  void _addReview(Map<String, dynamic> newReview) {
    setState(() {
      widget.movie['reviews'].add(newReview);
    });
  }

  void _editReview(int index, Map<String, dynamic> editedReview) {
    setState(() {
      widget.movie['reviews'][index] = editedReview;
    });
  }

  void _deleteReview(int index) {
    setState(() {
      widget.movie['reviews'].removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie['title']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2 / 3, // sesuaikan ratio gambar poster
              child: Image.asset(
                widget.movie['poster'],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    widget.movie['title'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.movie['description'],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      launch(widget.movie['trailer']);
                    },
                    child: Text('Watch Trailer'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Reviews:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.movie['reviews'].length,
                    itemBuilder: (context, index) {
                      final review = widget.movie['reviews'][index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${review['username']} - ${review['rating']}/10',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(review['comment']),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => EditReviewDialog(
                                      review: review,
                                      onReviewEdited: (editedReview) {
                                        _editReview(index, editedReview);
                                      },
                                    ),
                                  );
                                },
                                child: Text('Edit'),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  _deleteReview(index);
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddReviewDialog(
              onReviewAdded: (newReview) {
                _addReview(newReview);
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MovieDetailPage extends StatefulWidget {
  final Map<String, dynamic> movie;

  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  void _onReviewEdited(Map<String, dynamic> editedReview, int index) {
    setState(() {
      widget.movie['reviews'][index] = editedReview;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MovieDetail(movie: widget.movie);
  }
}

class EditReviewDialog extends StatefulWidget {
  final Map<String, dynamic> review;
  final Function(Map<String, dynamic>) onReviewEdited;

  const EditReviewDialog({
    Key? key,
    required this.review,
    required this.onReviewEdited,
  }) : super(key: key);

  @override
  _EditReviewDialogState createState() => _EditReviewDialogState();
}

class _EditReviewDialogState extends State<EditReviewDialog> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _ratingController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.review['username'];
    _ratingController.text = widget.review['rating'].toString();
    _commentController.text = widget.review['comment'];
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _ratingController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Review'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Rating'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a rating';
                }
                final rating = double.tryParse(value);
                if (rating == null || rating < 0 || rating > 10) {
                  return 'Please enter a valid rating (0-10)';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _commentController,
              decoration: InputDecoration(labelText: 'Comment'),
              maxLines: null,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a comment';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final review = {
                'username': _usernameController.text,
                'rating': double.parse(_ratingController.text),
                'comment': _commentController.text,
              };
              setState(() {
                widget.onReviewEdited(review);
              });
              Navigator.pop(context);
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}

class AddReviewDialog extends StatefulWidget {
  final Function(Map<String, dynamic>) onReviewAdded;

  const AddReviewDialog({Key? key, required this.onReviewAdded})
      : super(key: key);

  @override
  _AddReviewDialogState createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _ratingController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _ratingController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Review'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Rating'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a rating';
                }
                final rating = double.tryParse(value);
                if (rating == null || rating < 0 || rating > 10) {
                  return 'Please enter a valid rating (0-10)';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _commentController,
              decoration: InputDecoration(labelText: 'Comment'),
              maxLines: null,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a comment';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final review = {
                'username': _usernameController.text,
                'rating': double.parse(_ratingController.text),
                'comment': _commentController.text,
              };
              setState(() {
                widget.onReviewAdded(review);
              });
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class MovieSearch extends SearchDelegate<String> {
  final List<Map<String, dynamic>> movies;

  MovieSearch({required this.movies});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = movies
        .where((movie) =>
            movie['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        results.length,
        (index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      results[index]['poster'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    results[index]['title'],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetail(movie: results[index]),
                        ),
                      );
                    },
                    child: Text('Details'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = movies
        .where((movie) =>
            movie['title'].toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        suggestions.length,
        (index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      suggestions[index]['poster'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    suggestions[index]['title'],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetail(movie: suggestions[index]),
                        ),
                      );
                    },
                    child: Text('Details'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
