PFont font;
int nodeCount;
Node[] nodes=new Node[100];
HashMap nodeTable=new HashMap();
int edgeCount;
Edge[] edges=new Edge[500];
static final color nodeColor=#F0C070;
static final color selectColor=#FF3030;
static final color fixedColor=#FF8080;
static final color edgeColor=#8286C6;
void setup() {
  size(600,600);
  loadData();
  font=createFont("微软雅黑",16);
  textFont(font);
  smooth();
}
void loadData() {
  addEdge("约翰", "食物");
  addEdge("约翰", "小狗");
  addEdge("约翰", "茶");
  addEdge("约翰", "小猫");
  addEdge("约翰", "桌子");
  addEdge("桌子", "盘子");
  addEdge("盘子", "食物");
  addEdge("食物", "老鼠");
  addEdge("食物", "小狗");
  addEdge("老鼠", "小猫");
  addEdge("桌子", "杯子");
  addEdge("杯子", "茶");
  addEdge("小狗", "小猫");
  addEdge("杯子", "勺子");
  addEdge("盘子", "叉子");
  addEdge("小狗", "跳蚤1");
  addEdge("小狗", "跳蚤2");
  addEdge("跳蚤1", "跳蚤2");
  addEdge("盘子", "小刀");
}
void addEdge(String fromLabel,String toLabel) {
  Node from=findNode(fromLabel);
  Node to=findNode(toLabel);
  Edge e=new Edge(from,to);
  if(edgeCount==edges.length) {
    edges=(Edge[])expand(edges);
  }
  edges[edgeCount++]=e;
}
Node findNode(String label) {
  label=label.toLowerCase();
  Node n=(Node)nodeTable.get(label);
  if(n==null) {
    return addNode(label);
  }
  return n;
}
Node addNode(String label) {
  Node n=new Node(label);
  if(nodeCount==nodes.length) {
    nodes=(Node[])expand(nodes);
  }
  nodeTable.put(label,n);
  nodes[nodeCount++]=n;
  return n;
}
void draw( ) {
  background(0);
  for (int i = 0 ; i < edgeCount ; i++) {
    edges[i].relax( );
  }
  for (int i = 0; i < nodeCount; i++) {
    nodes[i].relax( );
  }
  for (int i = 0; i < nodeCount; i++) {
    nodes[i].update( );
  }
  for (int i = 0 ; i < edgeCount ; i++) {
    edges[i].draw( );
  }
  for (int i = 0 ; i < nodeCount ; i++) {
    nodes[i].draw( );
  }
}
Node selection;
void mousePressed( ) {
  // Ignore anything greater than this distance.
  float closest = 20;
  for (int i = 0; i < nodeCount; i++) {
    Node n = nodes[i];
    float d = dist(mouseX, mouseY, n.x, n.y);
    if (d < closest) {
      selection = n;
      closest = d;
    }
  }
  if (selection != null) {
    if (mouseButton == LEFT) {
      selection.fixed = true;
    }
    else if (mouseButton == RIGHT) {
      selection.fixed = false;
    }
  }
}
void mouseDragged( ) {
  if (selection != null) {
    selection.x = mouseX;
    selection.y = mouseY;
  }
}
void mouseReleased( ) {
  selection = null;
}