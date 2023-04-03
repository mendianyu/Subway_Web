import com.mysql.cj.util.StringUtils;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * @author Mr.乐
 * @Description ArrayList集合常用方法
 */
public class list_test
{
    public static void main(String[] args)
    {
        ArrayList<String> list = new ArrayList<>();

        //追加方式添加元素
        list.add("东邪");
        list.add("西毒");
        list.add("南帝");
        list.add("北丐");
        list.add("中神通");

        //删除
        System.out.println(list.remove("西毒"));//通过元素名称删除，返回boolean
        System.out.println(list.remove(1));//通过索引删除元素，返回被删除元素名
        //修改
        System.out.println(list.set(1, "西毒"));//指定索引位置修改元素，并返回被修改元素

        System.out.println("原集合中元素有：" + list);
        //获取方法
        System.out.println(list.get(1));//通过指定索引位置获取集合元素
        //获取集合元素个数
        System.out.println(list.size());

        //集合的遍历,普通for循环
        for (int i = 0; i < list.size(); i++)
        {
            System.out.print(list.get(i) + "\t");
        }
        System.out.println();
        //增强版for循环
        for (String name : list)
        {
            System.out.print(name + "\t");
        }
        System.out.println();

        //迭代器
        Iterator<String> it = list.iterator();//创建迭代器
        while (it.hasNext())
        {//判断下一个位置是否有元素
            System.out.print(it.next() + "\t");  //next方法表示获取下一个位置的元素
        }
        System.out.println();

        //Stream流
        list.stream().forEach(System.out::println);
    }
}
