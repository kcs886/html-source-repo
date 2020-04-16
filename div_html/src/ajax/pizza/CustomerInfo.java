package ajax.pizza;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CustomerInfo {

	public static void main(String[] args) {
		List<Map<String,Object>> cusList = new ArrayList<>();
		Map<String,Object> rmap	= new HashMap<>();
		rmap.put("mem_name","이순신");
		rmap.put("mem_addr","서울시 구로구");
		rmap.put("mem_tel","010-1234-5678");
		
		cusList.add(rmap);
		rmap	= new HashMap<>();
		rmap.put("mem_name","감강찬");
		rmap.put("mem_addr","경기도 안양시 동안구");
		rmap.put("mem_tel","010-5555-8888");
		cusList.add(rmap);
		rmap	= new HashMap<>();
		rmap.put("mem_name","유재석");
		rmap.put("mem_addr","강원도 삼척시");
		rmap.put("mem_tel","010-3333-4444");
		cusList.add(rmap);
		Gson g = new GsonBuilder().setPrettyPrinting().create();
		String json = g.toJson(cusList);
		System.out.println(json);
	}

}
