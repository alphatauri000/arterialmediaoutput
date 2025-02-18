import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            color: Color(0xFF0E1E42), // Custom Blue
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/logo.png', height: 70),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'ⓘ',
                    style: TextStyle(fontSize: 28, color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),

          // Article List
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                ArticleItem(
                  index: 1,
                  title: 'JAMA Surgery',
                  description:
                      'Counseling Intervention and Cardiovascular Events in People With Peripheral Artery Disease',
                  authors:
                      'Jonathan Golledge, Alkira Venn, Lisan Yip et al. 🔗',
                  url: 'https://pubmed.ncbi.nlm.nih.gov/39167413/',
                ),
                ArticleItem(
                  index: 2,
                  title: 'Circulation',
                  description:
                      'Efficacy and Safety of Catheter-Based Radiofrequency Renal Denervation in Chinese Patients With Uncontrolled Hypertension',
                  authors: 'Xiongjing Jiang, Felix Mahfoud, Wei Li et al. 🔗',
                  url: 'https://pubmed.ncbi.nlm.nih.gov/39229700/',
                ),
                ArticleItem(
                  index: 3,
                  title: 'JACS',
                  description:
                      'Analysis of Surgeon and Center Case Volume and Stroke or Death after Transcarotid Artery Revascularization',
                  authors:
                      'Nadin Elsayed, Maryam Ali Khan, Claire B Janssen et al. 🔗',
                  url: 'https://pubmed.ncbi.nlm.nih.gov/38994840/',
                ),
                ArticleItem(
                  index: 4,
                  title: 'JVS',
                  description:
                      'Clinical outcomes of celiac artery coverage vs preservation during thoracic endovascular aortic repair',
                  authors:
                      'Narek Veranyan, Daniel Willie-Permor, Sina Zarrintan et al. 🔗',
                  url: 'https://pubmed.ncbi.nlm.nih.gov/38986961/',
                ),
                ArticleItem(
                  index: 5,
                  title: 'JAMA Surgery',
                  description:
                      'Transfusion and Anemia in Patients Undergoing Vascular Surgery',
                  authors:
                      'Michelle N Manesh, Alexander D DiBartolomeo, Helen A Potter et al. 🔗',
                  url: 'https://pubmed.ncbi.nlm.nih.gov/39196543/',
                ),
                ArticleItem(
                  index: 6,
                  title: 'EJVES',
                  description:
                      'Reduction of Major Amputations after Surgery versus Endovascular Intervention: The BEST-CLI Randomised Trial ',
                  authors:
                      'Maarit A Venermo, Alik Farber, Andres Schanzer et al. 🔗',
                  url: 'https://pubmed.ncbi.nlm.nih.gov/38925339/',
                ),
                ArticleItem(
                  index: 7,
                  title: 'JVS',
                  description:
                      'Clinical outcomes of celiac artery coverage vs preservation during thoracic endovascular aortic repair',
                  authors:
                      'Mark A Farber, Jon S Matsumura, Sukgu Han et al. 🔗',
                  url: 'https://pubmed.ncbi.nlm.nih.gov/38904579/',
                ),
                ArticleItem(
                  index: 8,
                  title: 'EJVES',
                  description:
                      'Impact of Infrapopliteal Revascularisation Establishing In Line Flow to the Wound in Patients with Chronic Limb Threatening Ischaemia ',
                  authors:
                      'Osamu Iida, Mitsuyoshi Takahara, Norihiko Ohura et al. 🔗',
                  url: 'https://pubmed.ncbi.nlm.nih.gov/39067506/',
                ),
                ArticleItem(
                  index: 9,
                  title: 'JVS',
                  description:
                      'In-hospital mortality risk after endovascular and open aortic aneurysm repairs for ruptured abdominal aortic aneurysms',
                  authors:
                      'Tomás Daviú-Molinari, Justin Chin-Bong Choi, Marie-Claire Roberts et al. 🔗',
                  url: 'https://pubmed.ncbi.nlm.nih.gov/39002605/',
                ),
              ],
            ),
          ),

          // Footer Navigation
          Container(
            padding: EdgeInsets.all(10),
            color: Color(0xFF0E1E42), // Custom Blue
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {},
                ),
                Text(
                  'Dec 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleItem extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final String authors;
  final String url;

  ArticleItem({
    required this.index,
    required this.title,
    required this.description,
    required this.authors,
    required this.url,
  });

  void _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: _launchURL,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fixed-width container for index
              Container(
                width: 40, // Adjust as needed
                alignment: Alignment.centerRight, // or center, etc.
                child: Text(
                  '$index',
                  style: TextStyle(
                    fontFamily: 'Redaction-Bold',
                    fontSize: 80,
                    color: Color.fromARGB(178, 224, 224, 224),
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Expanded for title, authors & description
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Reforma1918-Negra',
                          fontSize: 20,
                          color: Color(0xFF0E1E42),
                        ),
                      ),
                      SizedBox(height: 4),

                      // Description
                      Text(
                        description,
                        style: TextStyle(
                          fontFamily: 'Reforma1918-Blanca',
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),

                      // Authors
                      if (authors.isNotEmpty) ...[
                        SizedBox(height: 4),
                        Text(
                          authors,
                          style: TextStyle(
                            fontFamily: 'Reforma1918-Blanca',
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
