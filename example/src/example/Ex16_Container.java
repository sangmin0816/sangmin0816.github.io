package example;

class Container<T>{
    private T type;

    public T get() {
        return type;
    }

    public void set(T type) {
        this.type = type;
    }
}

public class Ex16_Container {
    public static void main(String[] args) {
        Container<String> container1 = new Container<String>();
        container1.set("홍길동");
        String str = container1.get();

        Container<Integer> container2 = new Container<Integer>();
        container2.set(6);
        int value = container2.get();
    }
}
