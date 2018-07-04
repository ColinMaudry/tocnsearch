
      var tree;
      
      function treeInit() {
      tree = new YAHOO.widget.TreeView("treeDiv1");
      var root = tree.getRoot();
    
  var objd4e8 = { label: "Introduction", href:"../topics/introduction.html", target:"contentwin" };
    var d4e8 = new YAHOO.widget.TextNode(objd4e8, root, false);
  var objd4e23 = { label: "Care and Preparation", href:"../topics/care.html", target:"contentwin" };
    var d4e23 = new YAHOO.widget.TextNode(objd4e23, root, false);var objd4e33 = { label: "Pruning", href:"../tasks/pruning.html", target:"contentwin" };
    var d4e33 = new YAHOO.widget.TextNode(objd4e33, d4e23, false);var objd4e40 = { label: "Garden Preparation", href:"../tasks/gardenPreparation.html", target:"contentwin" };
    var d4e40 = new YAHOO.widget.TextNode(objd4e40, d4e23, false);
  var objd4e48 = { label: "Flowers by Season", href:"../topics/index.html", target:"contentwin" };
    var d4e48 = new YAHOO.widget.TextNode(objd4e48, root, false);var objd4e58 = { label: "Spring Flowers", href:"../concepts/springFlowers.html", target:"contentwin" };
    var d4e58 = new YAHOO.widget.TextNode(objd4e58, d4e48, false);var objd4e65 = { label: "Iris", href:"../topics/flowers/iris.html", target:"contentwin" };
    var d4e65 = new YAHOO.widget.TextNode(objd4e65, d4e58, false);var objd4e72 = { label: "Snowdrop", href:"../topics/flowers/snowdrop.html", target:"contentwin" };
    var d4e72 = new YAHOO.widget.TextNode(objd4e72, d4e58, false);var objd4e79 = { label: "Summer Flowers", href:"../concepts/summerFlowers.html", target:"contentwin" };
    var d4e79 = new YAHOO.widget.TextNode(objd4e79, d4e48, false);var objd4e86 = { label: "Gardenia", href:"../topics/flowers/gardenia.html", target:"contentwin" };
    var d4e86 = new YAHOO.widget.TextNode(objd4e86, d4e79, false);var objd4e93 = { label: "Lilac", href:"../topics/flowers/lilac.html", target:"contentwin" };
    var d4e93 = new YAHOO.widget.TextNode(objd4e93, d4e79, false);var objd4e100 = { label: "Autumn Flowers", href:"../concepts/autumnFlowers.html", target:"contentwin" };
    var d4e100 = new YAHOO.widget.TextNode(objd4e100, d4e48, false);var objd4e107 = { label: "Chrysanthemum", href:"../topics/flowers/chrysanthemum.html", target:"contentwin" };
    var d4e107 = new YAHOO.widget.TextNode(objd4e107, d4e100, false);var objd4e114 = { label: "Salvia", href:"../topics/flowers/salvia.html", target:"contentwin" };
    var d4e114 = new YAHOO.widget.TextNode(objd4e114, d4e100, false);var objd4e121 = { label: "Winter Flowers", href:"../concepts/winterFlowers.html", target:"contentwin" };
    var d4e121 = new YAHOO.widget.TextNode(objd4e121, d4e48, false);var objd4e128 = { label: "Gerbera", href:"../topics/flowers/gerbera.html", target:"contentwin" };
    var d4e128 = new YAHOO.widget.TextNode(objd4e128, d4e121, false);
  
  var d4e138 = new YAHOO.widget.TextNode("Glossary", root, false);var objd4e143 = { label: "Genus", href:"../concepts/glossaryGenus.html", target:"contentwin" };
    var d4e143 = new YAHOO.widget.TextNode(objd4e143, d4e138, false);var objd4e150 = { label: "Pollination", href:"../concepts/glossaryPollination.html", target:"contentwin" };
    var d4e150 = new YAHOO.widget.TextNode(objd4e150, d4e138, false);var objd4e157 = { label: "Sepal", href:"../concepts/glossarySepal.html", target:"contentwin" };
    var d4e157 = new YAHOO.widget.TextNode(objd4e157, d4e138, false);var objd4e164 = { label: "Rhizome", href:"../concepts/glossaryRhizome.html", target:"contentwin" };
    var d4e164 = new YAHOO.widget.TextNode(objd4e164, d4e138, false);var objd4e171 = { label: "Bulb", href:"../concepts/glossaryBulb.html", target:"contentwin" };
    var d4e171 = new YAHOO.widget.TextNode(objd4e171, d4e138, false);var objd4e178 = { label: "Cultivar", href:"../concepts/glossaryCultivar.html", target:"contentwin" };
    var d4e178 = new YAHOO.widget.TextNode(objd4e178, d4e138, false);var objd4e185 = { label: "Perennial", href:"../concepts/glossaryPerennial.html", target:"contentwin" };
    var d4e185 = new YAHOO.widget.TextNode(objd4e185, d4e138, false);var objd4e192 = { label: "Panicle", href:"../concepts/glossaryPanicle.html", target:"contentwin" };
    var d4e192 = new YAHOO.widget.TextNode(objd4e192, d4e138, false);
  var objd4e201 = { label: "Copyright", href:"../topics/copyright.html", target:"contentwin" };
    var d4e201 = new YAHOO.widget.TextNode(objd4e201, root, false);

      tree.draw(); 
      } 
      
      YAHOO.util.Event.addListener(window, "load", treeInit); 
    